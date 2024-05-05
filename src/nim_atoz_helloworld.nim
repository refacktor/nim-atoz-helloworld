import atoz/s3



when isMainModule:
  s3 = s3.S3()
  objects = s3.listObjectsV2(args.bucket)
  echo "objects: ", objects
