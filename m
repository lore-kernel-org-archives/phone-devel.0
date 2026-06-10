Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8544C3E450A
	for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 11:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091565; cv=none; b=QEKeTN8LCza7w+RSlYD7AXk9MvH1nGuoJyNfJhJccCg2uFBGZsfxeK0mv/8rYDQkYEhoktw9oDp51uEoNyuueUmKMwRq5IPL44X19i7biexm4djoJ1vpYEt0OOHLebkxMzwQ6k7BHbMhogh42oA4LlUoAJjLgrTyU9pU35r/5ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091565; c=relaxed/simple;
	bh=kJlyu0Ku8D5i/hWc61LWnoUqEP/8/5haNfDxLdtNTf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BbmZ7kfgnwWiqOyk7tRN/3gFnY6ZVe5CUAPQ/dpPwJKBaZ79l2TJqL64/Yp2+SIupqElgP4mAfZrPrmHVP7jNdZJm82Om1Av9FR87UP/yvBAO4ezOvdJQXOyO6qaav2CtPPJM90h+Z2ud3Q9cSBaCgylzj+jFGoD9KuttyA5dIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xzg1Ii7O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xzg1Ii7O"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so39781835e9.1
        for <phone-devel@vger.kernel.org>; Wed, 10 Jun 2026 04:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781091562; x=1781696362; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLodmWzrTN66XZxi0VhoRsFvF3s+BeRFANK73fDJpdo=;
        b=Xzg1Ii7OVeJT3vjDySZW+ak5IJ5AtIiF4LsUhdahySxIM/sz2cj3DbGOCmNLvT5pq8
         EeIkesKWnKX+ekoajvT7mh/3L3BuPdAya+lh4NbUnd6yaS4lVg1tDaHfPFUSNYohHjcD
         NlQZkTBtUFVsmXN8LAp4CJTJay4Z0CFhBwlh8gHGCawUFvT8uTKuL6XDzHNFHGq/I0gq
         0bgIo1d8G2kAUSh2FzCpdNc3a0rb5tXl8sYnGLrPL3LIGJl2MBcwgUxLhtMgZTA6aWRO
         HMMcVkTTluqlj1hFzBCrv66bleeucYqGjcGuXdo3axJtTEveaKWQ1pY2ZWXvw2HBiqbb
         hTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781091562; x=1781696362;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dLodmWzrTN66XZxi0VhoRsFvF3s+BeRFANK73fDJpdo=;
        b=c/gBSJXtyp+9Fi3ILEaX/kAy67ILucLArI+NXyOQA/gYogxuZ0jryuA0dC+norqC6N
         8xJfOLybrwD9PdrOr/WlWm4KQ3M74lBZl09idxWqku46nilhnt+EiCV9lj0iqv5faUKt
         1PmoVaESl2/f6N90dRJCbsMeTqrpJmrDYJhFP/eofwmDtYJEZocG1pswg5hYBiyqRJyl
         BGbCfqKJN+uuDCRZpvHaaPt/C9Fw/ElUZ/9pP+kupVb2jnGJpPUG7MfHhdHM2PN4eNIU
         lgJ1xns9NY3DdAeqSxyVA7ZOAeR39IqjmbHYBVvZ7dfCqLZhP8vwhJpnkQ/TRf6m0QAJ
         b2Uw==
X-Forwarded-Encrypted: i=1; AFNElJ+nWT83eyEsgcweHwfUT7uvwO6Nhcgbq5/UzaP1bTz4mkoWZ/8aSA9KWU8zMS4wlR+lYHBQCyKPihC7Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFmrIV3hgIBxWFM2M2L9FM/49gcFxrK1zyXHLniWfk999pxwht
	wlT+We2Pxwa20tJnT9pk0qS5FHwIB9jbzReoKdKsL1foRxMCmpin42dM
X-Gm-Gg: Acq92OF7gAAgBkwORgy7NC/Ges42TdLQNBLkXCexnhx58jwn27WSN6nVNY6hkq4nqsH
	FFYNYMRsMCGBgc2OeLjfiCJi8MniczUsTkSKnROlY3Qk3qRAXoSo4T/JpuyKvdbqFRXBl32YIP2
	KqBH78LjAC3rmoG3CrJ+Btpj2AHWDtJbEM7vptdk3+WGK+ot8jpKec3cLALyhAdcDWr75CDL0bj
	m9JeA4liztWeBYS1hKw72+TcIP9OyoBCebCvLmXdJqx2YRang8paMWQ84120naO6XmsytrpVdAx
	umJnDq1wau4VCankVUdCJ2fXmjyzdKKGrStAr3pRWpg9EqWGI4xQGQzGgNOBqltSJHILaloKirw
	mGna0BLwjfZegAzmSLYbTrqiKMPitPCKZqtlK25+XQ6Pb1KrRlvHjS+2ual+6tLNIkh5DiPu7EH
	P0zCjXqcfF+jPYj2c3f1n1yY+UVVL4ofRGSPm9aJ4=
X-Received: by 2002:a05:600c:3107:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-490c264cc2emr408619475e9.33.1781091561822;
        Wed, 10 Jun 2026 04:39:21 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:7c0c:c5aa:32d2:49d:5951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm68042009f8f.19.2026.06.10.04.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:39:21 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Wed, 10 Jun 2026 14:38:56 +0300
Message-Id: <20260610-yukon-eagle-v4-0-763d5698bd2c@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13NTQ6CMBCG4auQrq3pP8WV9zAuCkyhKmAoEAnh7
 lKMEVx+yTzvTMhD68CjUzShFgbnXVMvQxwilJWmLgC7fNmIEaaIZAqP/b2pMZjiAVhJbZnV1FC
 Ro0U8W7DutdYu18/2fXqDrAuJcFE63zXtuL4baLj7luNdeaCY4ERTmuRKmJim56Iy7nHMmgqF8
 sB+VhG+t2yxVqtUCCI1t/Lf8q0Ve8vDX+CpjHNOlNFbO8/zG9fqjxIwAQAA
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree for Sony Xperia M2 with support for:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- Vibrator
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v4:
- Defined pinctrl for GPIO buttons.
- Aligned quotation marks in mount-matrix for the accelerator.
- Dropped magnetometer from the patch. It probes, but fails to read its
  revision if reset GPIO is not defined, and this model does not have a
  reset GPIO. Nevertheless, even if one is defined, the probe fails with
  a timeout. Needs further investigation.
- Link to v3: https://patch.msgid.link/20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com

Changes in v3:
- Changed incorrect "chassis" to "chassis-type" in the device tree.
- Mentioned added vibrator in the commit message.
- Link to v2: https://patch.msgid.link/20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com

Changes in v2:
- Dropped `regulator-always-on` for l3, l6 and l8.
- Mentioned added GPIO buttons and reset input in the commit message.
- Link to v1: https://patch.msgid.link/20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 407 +++++++++++++++++++++
 3 files changed, 409 insertions(+)
---
base-commit: 49e02880ec0a8c378e811bc9d85da188d7c6204c
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>

