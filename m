Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C14286436
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842909; cv=none; b=QTwLE5aduFUxAXlLRRXBogF5gF3nq1U90tcMUKZ0Vw8uk5QTQhxSSudI2NACUnZ7zew9b0uEbEJGCehRJbaq5dvTo2FLP2lgm5u9Igl68lTxQ9RQU2YOYh+gT6y4+UII/3NLVwIlbAli2d6R2MNdMcjlCKVnjs/oui8I3IhoeUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842909; c=relaxed/simple;
	bh=ZJaHdZ8mGsEkim1yUHwLTnvHu86W+l4CWYVjRpNDmhU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XlG5Bj2VEseVbm1aAWZH66fHrfsmkSPYNLRA8u1IzaJ7Ki7Q0uRoJ1BN2YhNgTUc4rzW6W7klXnUDKosaWRKVUFmZdwRBdsE2XUiQEgsXphVhWeUwFjmSPEQPK947S9URx9FZzhYvNTTVeh1XyYNEdAkJm3vz/mrJirwjkEL3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BneAK4eH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BneAK4eH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so136602066b.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842906; x=1751447706; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0x17E1px+EqXNrObaDGYbqObszP+McDhL4Yp7KySDHU=;
        b=BneAK4eHcGdiUTt+8NfUE26uw6s6BPk8iqVw9NCRp1XfGnbRnBNIxMXn+zsslTD+ot
         /rzyXzdpGcB7DpQ4Wv10Ejb3aTpxEpB747cK53sAaK7bvz4w/2VrOGbcIIddyyer7xHd
         hAU0q/z1CR1sCu7wk6blAvN3XvJtbUZHLyTJSbmsuv2+h/grSgGDZwHo7btAzYb8/kuc
         G6vbKrp7+asdsVXAw59r926TQwy6ORVonM/qtQaoNW/Scip0vR/bdT7dhcbitbIPq02J
         9bBqoAN+qn1iQcmg6wDy+yhlcxWwgoGCaDtSTwdq91xA5DgHn7Ih6M4+BHWsMGnFJNHz
         KshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842906; x=1751447706;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0x17E1px+EqXNrObaDGYbqObszP+McDhL4Yp7KySDHU=;
        b=SpqYwc/157kPieQHUUIAcPHADOsGDRTGWarvVCHeAKbj7JE7SsMRqLs+WzbTALDziw
         yUnage3ZWjG1x+3j8H8Rzy0MQ8X8f6sXVe6oqFZPkdMIgN5vQhaQOfeUeXNv3KTj1wwn
         ZrufPXiB8PKXiQEvoCbiipUVTy3id19XW8FtbST7dh7OoamqMXUaSIUbZFGdNg2JmS/t
         Kz3FOh/c4SHX1KI9RSiW9xnmMOrTItdC+mm3+tvSNHLPTbwPY0kYDoPBgANg3G1QT7mx
         r+aR5wpaEgWv4INmBvvBHPQfk+6+zKZrY4kV9ickS7clVSJvl9nasGRY/uBdCdfqjRNT
         W2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWYmNfU5VuQGwA7Gxj/hdXY+mbZpKErB2+uaEBiwZhyuIHNkTyxGbqYai2reEE5xBgdubVxc25dju2IxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAMhGWKWlTjFIBVniMzFSvDl7AQqHWuR1UQx/Nl4HnblesuVz
	gUJEO27eujSon6ffU5qO1vDN3ztY4chTFr91P8+7Nk6ZBN5lKsWSec2DWq7ovERh5YQ=
X-Gm-Gg: ASbGncuwb/deUmGM/1ebq1fw2zbCFdTqvFjwJC6HQJ+3g0FMrxguKaiyjWzl772OqIJ
	LubiF1iLTIZe1QfjkxSoWPCVr5K7MAzHDZ5nVvZR+/pxB0yxk5Zg98X32i02emMx9WPQIiB6+OF
	4TDgyCKLOo598+BqUW07Yu2uSdc+BawAziGZFJ0eRpurOq3jYksATieHMhhmdL5uPkH9ZdwJlfa
	V14RAcEkfUSbyU+BQzxhyqJBau3gadYHYB5dwh2A684weouMOpnDue9HPj7qEuQrimcK7Zrr+LI
	LZxhiZCU4N1tAb5PMjxrp6L1/IxzNPa04xPs3Kak+Xx+m0d3EohXhl3/4HGK4rl7ZBViTvmt2LV
	kP/LB0kan0KHKQ/guDtmQLIU6F9SE6eEk
X-Google-Smtp-Source: AGHT+IHossRczIQDoFPo3XWwZlIhvHUPsFfJ84XHSqNsKPDmWvICk4145QI/+MNPKeaIC0aeiLBBgw==
X-Received: by 2002:a17:907:c1e:b0:ae0:c6e5:9738 with SMTP id a640c23a62f3a-ae0c6e597ecmr107772766b.55.1750842904882;
        Wed, 25 Jun 2025 02:15:04 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/4] Add support for eUSB2 repeater on PMIV0104
Date: Wed, 25 Jun 2025 11:14:55 +0200
Message-Id: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA++W2gC/02NQQ7CIBREr0L+2m+ABqpcxXRB6aeyKFWgjUnTu
 4t2ocs3k5m3QaYUKINhGyRaQw5zrCBODNzdxpEwDJVBcqm4lhzz1OpGIS25x0QPsoUS8qG9eKV
 aeeUe6vSRyIfX9/bWHZzoudT3coTQ20zo5mkKxbBVn4XG5AT8aw07pLX62ORPV5YY4ohe6aYRT
 vfCW7NK6Pb9DZsmrPjQAAAA
X-Change-ID: 20250620-sm7635-eusb-repeater-0d78f557290f
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1080;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZJaHdZ8mGsEkim1yUHwLTnvHu86W+l4CWYVjRpNDmhU=;
 b=wvQWFKLPrm1zGX2IzrnXnA2E17UIblNOckLeleDSLHmvgeMDGWHzUtWv8VsXxcuiFfqCEDyNh
 IxjlOTrg7kQC6ynnmpaa54qFXzMbTvmVd52L6Mww7I/gvqvzRvVb3+O
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a new property qcom,tune-res-fsdif for the eUSB2 repeater and add
the compatible for the repeater on the PMIV0104 PMIC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (4):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Document qcom,tune-res-fsdif
      phy: qualcomm: phy-qcom-eusb2-repeater: Support tune-res-fsdif prop
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for PMIV0104
      phy: qualcomm: phy-qcom-eusb2-repeater: Add support for PMIV0104

 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml |  7 +++++++
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c            | 15 +++++++++++++++
 2 files changed, 22 insertions(+)
---
base-commit: d9946fe286439c2aeaa7953b8c316efe5b83d515
change-id: 20250620-sm7635-eusb-repeater-0d78f557290f
prerequisite-change-id: 20250616-eusb2-repeater-tuning-f56331c6b1fa:v2
prerequisite-patch-id: 5c504d171a4d1acd9ec376e01e0dd0fddbad92b8
prerequisite-patch-id: 0c97dcf5472fbed8ef4cffbd482f3169fe1e972d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

