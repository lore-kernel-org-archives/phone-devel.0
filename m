Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61A48A8C8
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742412; cv=none; b=EomxNYRsVOvI6ArnPsIOpVDk6XylH/FljSKRL06fyku/6vdYlh3rEpg20QNITWYIozJX7VfBksChw9CAwN3HxzI0C3tHDDxytr1u2fhJVSwnbJzHMP19f6IbiG5O7dmgOFjIVzfg1RYnB9kY8T7VBfYLEpobRu2+OUPfHXovJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742412; c=relaxed/simple;
	bh=LnOCLi1t8Bj2U3X4K5t0uslhmFfyG1Xu8O7lRIkja+8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L2te6SFmPzEQn+rfQwo+IYKs7iWagq7igTvRlZdbs7MFsizacANmxPB6t7qRVhVct4z/TMh4kHQIppiEK0dhN6RbfQtkJnnrWrrPgYC0ztXXRF2eE20gGsuU7L1EuV47WA7vMZ5w37bPjiVggQAfkwHNCjva3tkuiICj1OjBfpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=j+/R30Wg; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="j+/R30Wg"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294af0caa8so118525466b.1
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742408; x=1790347208; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkU3ODIuhAAsu4O/XI/NDvqsvZfMhywu2ET0wE91o6o=;
        b=j+/R30WgrX+NkB18orvnO5Y9i3Hlk4k4tARULvQ51GDXUTxl4taUltInFcpes31G3T
         rr3HuvdGMyq8+Xjo4wXzcPcTgvuha4E6/MmbPDMlFwTVjGDhfqPZhj9N2XHue8U3cMs4
         R5DpdFYK8l++hOsM1oSTfors+csnOiDXchQEgC2YVepUN72pJ+Oud5g1+ttM6TQKPDLK
         UcuIgGKQRbMfYooblSUYAr1Nq1F9oP4HZdGeXMuBiaArb/r5OFgPkodM22YIlpfFPxb8
         78/JG2R/BMqLTjNLTC+cstKP9jll958QWwWoAMZk32BByhey1xHzJdXtGgDpctvv4VSI
         yEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742408; x=1790347208;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LkU3ODIuhAAsu4O/XI/NDvqsvZfMhywu2ET0wE91o6o=;
        b=GcuJ7JbrGePkCCLI6c7EXGhujszAWwVqIx6wK9WX0swgkiSprODfSqS/SfhsUjC6DR
         /t/TiM8Bv7KJsyTD89LRL2/2ppUexSVgmfjWRG0/sC781pqgWXyXJxVzIzMK43mDTR8G
         eonXCM2Cqmxv2Unp1tqvBBRgiQvrIUCKOOnZtXz69VkpjmlZVfXtiHMuBvm7uec0KnPW
         yKm5sspML0fvsTfrShIZ4LPW1ePPN9k76z1Q0GP7x8brWAaUSlNfwg9y8wd47IT81vmd
         zzfhGFr4teQoOsg9Nge9w+dSWaags/0GqsjdrAdRYnGjIEV3tBYbgnV0BJFdCe0DSgCZ
         dHjA==
X-Forwarded-Encrypted: i=1; AKwUvBwp88+U9994KMrab2xPO+vUtiQ8XGNfkk3k8PVtOcWV4Gg1Sf6rpV+e0X/TzYT+mrKbixpwP7O5cXEgKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mDFAAKgqJIkA+1wxThrD8FVJ18+WTmOsv0IWnEk7MolTjC389f
	Bxe9nU6jEK8oWfVhx6wOPIMWXhfHzPR3uJlkPLw1CRo9dxakBtdXuxaP4Lg/S9h02VU3uq+euNN
	3X3sl
X-Gm-Gg: AYBFou0CncWnLrV/XvhCxoBn2VBBMiWwR7xbMCXGWOJ2fIm8xzmYN6TPiSmWXBHKCEx
	H5CiLjQ6epGg6SPpMrA8vDB6rJb6Fn8zsL4Q+Yo5mL+wqT+erm7sW8RIgWc2Ux4IUj/MHq9zjGr
	6VbA3bKdJoNq9ujx3Y+FpeNrn4W6NzwggK2ueBsfZ7pxkE4KKFpFIRFshvR+eai/i4ORaCKQaRO
	xqrSvt8/3vlkVNhZLkfZbxlhNi2gnmrFT8bilBnVNADOdtuMZSako+im/TmsM79dl2ajbg8jc+Y
	K4QGfg24q3pImDS5onppDSb/ofntcCP8ixG1szPr1x592uwVRCL/Dbp9WeFfEtcTWq1Vmz4Lv0+
	RwQFpecZjDtjufcO2+lIs0tBM5U0ELo5rpyc6Hll0+Edg34541JuLd5q2YSkKUCglt13V5FlSGY
	NKH1U38kERqqdlndI5n/irauV2WB3B+R7q+Ufm2Bhxc1d5rUcUem5Vofin5Edx7t85tpYa/ajFG
	mK698pc0Z1JEHMUALsI1L7rwdPRP3C5FN/RH2i43ZgRrhRIp2RIog==
X-Received: by 2002:a17:907:c0c:b0:c24:b11c:6c05 with SMTP id a640c23a62f3a-c2a156d58bemr272513366b.14.1789742408589;
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1b7a369esm64244966b.9.2026.09.18.07.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:40:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add Novatek NT37705 panel driver for Fairphone
 (Gen. 6)
Date: Fri, 18 Sep 2026 16:40:03 +0200
Message-Id: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OQQ6CMBBFr0Jm7ZAWBC0r72FYlDJIjbbYFqIh3
 N0CLl2+5M2bP4Mnp8lDlczgaNJeWxMhOySgemluhLqNDBnLSlYwjt1Q4iANPTBv80IJIdqzOEL
 0B0edfm+ta72zH5s7qbAGfoaj1xifhF2DRnpCZZ9PHapkOqU5OpXDet1rH6z7bMMmvsl/NkwcG
 RITqmFFWXClLp3UbuitoTRmoV6W5QtDUYv85AAAAA==
X-Change-ID: 20260501-fp6-panel-3d35c999d894
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789742407; l=1177;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LnOCLi1t8Bj2U3X4K5t0uslhmFfyG1Xu8O7lRIkja+8=;
 b=tfhs+1QCTPakQSMArYo3Qc5awfvXxVAu3VGhjGKoN6x8OFEeUZqKsENV2eUvrbAJa1KfOq2xd
 HzlZhifolmUDnRaQt/+PIUiu+kBtH7aTfKxlNwGmF/x7J+aPtz4RCd8
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add bindings and a panel driver for the NT37705, and then enable display
on the Fairphone (Gen. 6).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix kconfig dependencies of panel driver
- Pick up tags
- Link to v1: https://patch.msgid.link/20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Novatek NT37705
      drm/panel: Add driver for Novatek NT37705 panel
      arm64: defconfig: Enable Novatek NT37705 panel
      arm64: dts: qcom: milos-fairphone-fp6: Enable display

 .../bindings/display/panel/novatek,nt37705.yaml    |  72 ++++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  64 ++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt37705.c      | 413 +++++++++++++++++++++
 6 files changed, 563 insertions(+)
---
base-commit: c2cd463d6ee7d55a3ec0719d93c49ff99022d58f
change-id: 20260501-fp6-panel-3d35c999d894

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

