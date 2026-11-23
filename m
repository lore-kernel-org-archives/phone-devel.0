Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795466050;
	b=YlaIy/qcEkd1iGSCJcrGJH5C7QAK9Fk6qvaVmmxiEsnG1n6UqLK2kWiYBE/yp/7W3dnh
	 aECxGhzOH0g9f/n2o2QK7QuylcaMQHBHD5bO2UUNQwr8O67R93ZM2cDdJRMFbJmsuzqX4
	 8X9M2i8LUVk55bCLSMfxtfeMMR5LBOmyE7gm1xwj/8jBwO3QtXRo35Lv9knbkzf8cMqi5
	 Q18FATJeJes909YlRujhK7fPh0MYqsAqUSQhFp1JGqn8HxwuOEtxWPQrdwm7jSe6VRjLa
	 Pn59/Xqp7X7FF/fi+vTOISV8z3Q1A22eYO0zGetHL8wIOFfeBl0c7yPduna6sQVs8jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=e2HIsCv1tN4Vi7S2Bt6sM0bBboMl+JYL9mFDX5CB8EU=;
	b=j8AGuD6qQLrd6VHbCe4Pp5m4aw32C2EN1oAn+EKN4+iu94tluV4hj6blPH1PYTvvzGAT
	 mVxFwC2zP+dy/qi6o4xWe0ZMCsjNfFW/kkLNITJLpR9o8tPf0udBZI9XQYddLj3j3aeHu
	 SFH7ZQGxcKBiHtuejZYX7L3/Kl5cHowqVZQfUe4atz1vCzA0rnyoIZ8PGtbiRbvayxo0I
	 q87eelKuNntHvA9N1RZBYcmLUAuOWNra4sIcsCU8AC7dxZG9A23uZ13bezdrWHzvCXN2Y
	 ZC3iOmQ8vD2waQPYVfoVLycReO/UH6CgvArXuZUDMV3cFGyYH+bT9J3wJ627o4c2k5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0dkIdz1;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A97606A31E
	for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 20:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12A97606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0dkIdz1
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso34921625e9.0
        for <phone-devel@vger.kernel.org>; Mon, 23 Nov 2026 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795466048; x=1796070848; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e2HIsCv1tN4Vi7S2Bt6sM0bBboMl+JYL9mFDX5CB8EU=;
        b=Z0dkIdz1roQI0bhGJaA9+OHdDJUb11pyWR1I0jClrb25KvbgqdbiUJpTQ/2I5gSBa1
         ox35HBBCOO/04aN+1/A2xtOItH+b2YFK3uEiKdSjLNqcUXt7OWClMQuHYnWIlhzNABdT
         8JGr7lszt+hrHB3P1lnIuYM3IuSJLMBfr4IQKPq8lfbOhRi5Z5Bqc+XiAZlqJLcfqu6F
         Tex4oD/W46mqnR5WWtm149Ey8O/ke4KvGBV89JhJiqn7Z5DGI3EvTQeTBtsgnr6oNDYH
         CBKE3gbHgR6HixF4//gzTiEUrZxUyfLt/Bi5nmrzEfR3RtbNbrsgZkb0JjKoZTjb6IMA
         s4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466048; x=1796070848;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e2HIsCv1tN4Vi7S2Bt6sM0bBboMl+JYL9mFDX5CB8EU=;
        b=dzvhXis09snP9PeHkVJ/DzD8m+S7lU8G9GnSYj67bi1qNicvUGI++vrVV7Ku5IzCGT
         We8cXK0ttWIbI5rXXhT3Kul2V5hi/m9J+KqOAUOPP/sGJvX4KzReC/4q6x0cZtxcrWRP
         4RS6AXH23BjcADUfanTtpfEqwBEUqJeeTeRwKLb3E8fq1BL3b/aR/4+G6/xAGPNui72t
         /3IJMrvEkMmVbiOQzeSLC3/KdFPpbIa1SJijq6VGPe3agJh3AqX0wDaqci4EiKxN5JQs
         etuuw6gHQB4FBpB1iNSAUSNs44oF+tpjaoBsHtM/tLxJbhkRSG+1edTeaQaGS+Lm9AWD
         DXqQ==
X-Forwarded-Encrypted: i=1; AL+hErFp8Un8BSM822VDt0Iu8pZaYORW5uUWW6sXwUmtJ6EaWhanCZ2+9BQxp7S0EGiHZ54bQ3oEuk+bJjtZYQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iL26UcFLCoROeynlh2QbDOPs0i3XAZlngzhu17Bt4uK90Cvfg
	kSqqCDO7DmcvjgqEn0TT4xhZNG5Gl8N2RpO830tCqtK+G2eZF+9yUpKC
X-Gm-Gg: AZFdTZcmY3RX4KAmJkLxr49g6mJzBsJbELE62B/IslGmMdqoD0S4de6ajjjCPKomZjd
	qjauRMS3Df+blxzrEeS1E0J0NORNT/L0XfiPMreDIQM54mrmmb2IZLUnToT6PikxzzZklta0Iwb
	GWwvHeLiuBHqXp73ZAEkHO+X2fEQBvajprOc6itpd2zmjEbux8tsEy2M9y9oZ1nJOai+CrkzmhY
	3JufLFSOgHS75aTruuoElgA/xlHquvmHao6je04WkeLQQhBEGncIrIA1t6F3iYCP38WiulYj1GH
	2Izv41/xVTQYB/pBWYH37sVMB7IahGydPAUz/cFMm//Wr3D75u7cPw9ao8uMj6KGecW2/HB3Wnh
	Ys+qHzoNHmk17XyHsAU2KOaRK8GQFUQbonzdTeVp2OV8rwEwes+Q7bMJkE6ZjM2T368M+PaKfWm
	5HZyL5LtD8eK4kIDjA2RUyY2aY/prUiR+3QIxPrPd8mz436jm9+OVK115ffYdWtGSN5L1ZB6XQ0
	BgZoHnhUWmag+D2zuJDiHeptGjV2Ew7z+8W7fDucnIURTyZjGkPlZgNBETE4y1eg+yBYrpAJ8kc
	Mqy4bF+CwjJ0TC2WBw0L3mKGH8Osbw==
X-Received: by 2002:a05:600c:64c8:b0:4bb:6848:d433 with SMTP id 5b1f17b1804b1-4bb8881d141mr251247305e9.26.1795466048254;
        Mon, 23 Nov 2026 12:34:08 -0800 (PST)
Received: from unknown.local ([151.34.53.154])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm515946805e9.13.2026.11.23.12.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:34:07 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 0/5] media: qcom: camss, ccs: Sony IMX376 on SDM660 using
 the MIPI CCS driver
Date: Mon, 23 Nov 2026 21:33:52 +0100
Message-Id: <20261123-b4-ccs-imx376-v1-0-2b26850a6f11@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5EQBBA4atIrVWiy99kriIWuhVKwky6EIm4u
 8byW7x3gLIXVvhGB3jeROU3B5g4Ajc0c88obTBQQoUxRGgzdE5Rpj0tC0zStqGcyk+XWwjN33M
 n+/Or6te62pHdck/gPC+R5DbtcQAAAA==
X-Change-ID: 20261122-b4-ccs-imx376-03da25278f5b
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Gianluca Boiano <morf3089@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795466045; l=3605;
 i=morf3089@gmail.com; s=20240402; h=from:subject:message-id;
 bh=Ux1jAIk65UvpQG9eUkT9o3z3KHkRuAwplFQDfWVP5dU=;
 b=Vskrd5wcS4R1Anr5d6Nyalh7iBdzMn/H73Qb2lS95hRFgbE9FGaCuvQ9ikd9Hacqt/V2wzhXR
 6U9YRMIlS/oAOkvr6vMQ5bzaJ2s+MkhuOnvS0jFNeEWgPI1e7GDTjVa
X-Developer-Key: i=morf3089@gmail.com; a=ed25519;
 pk=HsGrEQ3ia8BGGGO8/nUM2K2UX9JKvRPV+nbrVDGrYhA=

Hi,

These make the Sony IMX376 work with the mainline MIPI CCS driver behind
the Qualcomm CAMSS on SDM660. Nothing specific to the sensor is added to
the driver: the DT node uses "mipi-ccs-1.1", and the manufacturer specific
register settings come from CCS static data (sensors/sony,imx376.yaml,
https://github.com/M0Rf30/ccs-static-data/pull/1, to be submitted to
ccs-static-data).

Tested on a Xiaomi Mi A2 (SDM660, rear IMX376, 4 lanes, link frequencies
500 and 864 MHz):

  - 2592x1940 (2x2 binned), 36 fps at 500 MHz
  - 5184x3880, 29 fps at 864 MHz
  - switching between the two repeatedly
  - cropping the pixel array (4096x3000 binned to 2048x1500)
  - the front IMX376 and the IMX486, which use dedicated drivers, still
    stream

Patches:

1: CAMSS calls s_stream on every sub-device from the video node up to the
   sensor. For a sensor with several sub-devices (CCS has a pixel array, a
   binner and a scaler) that includes the pixel array, whose s_stream
   fails with -EINVAL as only the CSI-2 source pad can be enabled. Stop at
   the sub-device that is bound to CAMSS, as the other CSI-2 receiver
   drivers do (ipu3-cio2, rkisp1, ti-cal, ipu6, rcar-vin): that
   sub-device is responsible for starting what is upstream of it. This
   touches the loops that Qianhui Xu's "media: camss: video: factor
   pipeline stream on/off into a helper" also changes; I'm happy to
   rebase on top of it.

2: The link frequency and the pixel clock were looked up from the pixel
   array of a CCS sensor, whose pixel rate is not the one on the CSI-2
   bus. Use the sub-device bound to CAMSS instead.

3, 4: Two CCS bugs found while doing the above, both regressions from the
   switch to sub-device active state: the format set on a sink pad is not
   stored, and the format of a source pad does not follow the crop
   rectangle. Link validation fails with -EPIPE for anything but the
   native size.

5: CCS static data can carry manufacturer register blocks conditional on
   sensor register values (rules); the driver parses them but never
   writes them. Apply the matching blocks at stream start. The IMX376
   needs this for its full resolution mode, which uses different
   readout registers than the binned one.

The pipeline is configured the usual way, from the pixel array to the
source of the CSI-2 bus (here the scaler), setting the binning with the
compose rectangle of the binner and then the size of the sink pad of the
scaler:

  media-ctl -V '"ccs binner 2-001a":0[fmt:SRGGB12_1X12/5184x3880 compose:(0,0)/2592x1940]'
  media-ctl -V '"ccs scaler 2-001a":0[fmt:SRGGB12_1X12/2592x1940 crop:(0,0)/2592x1940 compose:(0,0)/2592x1940]'
  media-ctl -V '"ccs scaler 2-001a":1[fmt:SRGGB10_1X10/2592x1940]'

---
Gianluca Boiano (5):
      media: qcom: camss: Don't stream sub-devices upstream of the sensor
      media: qcom: camss: Look up link frequency from the sub-device on the CSI-2 link
      media: ccs: Store the format set on a sink pad
      media: ccs: Make the source pad format follow the crop rectangle
      media: ccs: Apply rule-based manufacturer register blocks at stream start

 drivers/media/i2c/ccs/ccs-core.c                | 106 +++++++++++++++++++++---
 drivers/media/platform/qcom/camss/camss-video.c |  28 +++++++
 drivers/media/platform/qcom/camss/camss.c       |   6 +-
 3 files changed, 129 insertions(+), 11 deletions(-)
---
base-commit: aa0f4c41d4870a18e65772a1817af16427200371
change-id: 20261122-b4-ccs-imx376-03da25278f5b

Best regards,
--  
Gianluca Boiano <morf3089@gmail.com>

