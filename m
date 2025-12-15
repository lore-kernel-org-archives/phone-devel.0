Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE23732C336
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 09:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789657; cv=none; b=llfQMFoOlZ5sNkGYI98YfS7ntfpmreStu4zP6iRsb/Zj/DbXfp7xQwlXa7Tq3oVTIr2IB270mXsiaXtjMuPqG+5jk8bO7JFnZSKgtXzHDg7n515CXYrVLCuJLSMfQhq1hEz1/IbmBf340MhM5EhKc1PEp6ZxGIirzz8Ho0DxiTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789657; c=relaxed/simple;
	bh=HsVd0+ZsludRLKdBPavQwwwUogi0DIXtCeR7VoJqTbY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YwtcUWQpNnzpVnABB0DWCEzF5quUxTlrjFWtWcD40HO+rvDtcZmU4w/K2BidDojdWHfuWrJNF7P5MWTMLDPZPaztF+Es8IvNJiMkDJQi7+KfM/C4AorY822kkTvm0XW0vJusX0K7rUbgvCowko3GeMMSnSOsHV0GGDq3MDUSMng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmByw0ZY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h8tpeyRC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmByw0ZY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h8tpeyRC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF969cK3064937
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 09:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CVomacDz+jTUVRA16wHHJ8
	YMg5YJ03X/LquXvi2T+6k=; b=nmByw0ZY+k74+/EK0DQ2FxVqAzdD7ZF0+pVUOG
	i6KP5rSVL9MZ2aobWJ/BbnwbxD37YrQl8dkJM8WySCimKmhhsZorvxwezDjJ82JI
	wpWJNX+P5LEHuuPSlvEI4oOI5J2xEpil6fOtJxx9Fye76Lhhoet9snAuOE991k+m
	PqWdZF59CMJ9acrVdMUtD1deW6vPwD4eAYK/z6i+TAaoC09KYEsrCnLs/aJBe8QQ
	pl/7oKZbNTSoy1Pmq/MsZTK9TNzsdVLEFkk739/YAis0AeI7Ek7XDHmwVw4j0BAB
	27iICLi1L0PNVVl5jl+4Rp/DnpxNJjd68urBXYZyyi8BxfIA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119u3wr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 09:07:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b993eb2701bso3218901a12.0
        for <phone-devel@vger.kernel.org>; Mon, 15 Dec 2025 01:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765789654; x=1766394454; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CVomacDz+jTUVRA16wHHJ8YMg5YJ03X/LquXvi2T+6k=;
        b=h8tpeyRCa1Aig6wWPpO+Mbq6XjSawyvu4dbnJzCo9zH1A/56hETUgykYw8m02SDkX2
         BcUktExJdsPyLgOUN/FGh3zcsf7+HyjSa694BOJihgp5QE8CWv7Y0Kiu7pPEyx5Cz4Dr
         m2/yORnBQ8KiYktsQXSenuGfGAK2KN+9+N1OAmYWDU1nqNjF+CmpOdqZlqKg0hqvh/4A
         RQbLIuGUqgBecKjmmek83UlBAQBSRmGaGe8IOPqi/uB663rixv0TW47LLLR8OosylrWO
         iV9OeecRc0VEpiDVEz+hymYQF2LC6+zOi+Ku4FFOt4kKt6sCvpPStpeHignJMd7CROJs
         5lJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789654; x=1766394454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVomacDz+jTUVRA16wHHJ8YMg5YJ03X/LquXvi2T+6k=;
        b=bTLBRElkQ1AE/6JvReLJeLj5IK75sBfOopKk60MHHrfsd0yA8m+P1idraoVG8GN/nf
         sSm9Dd2nWcSD0hsH6F0Y/7i+dXmqjQDAs7cLVFUSOW6oUVj4Vsz5qtvlQggxUC9vZMKN
         Opa1oVcY1S9BX8vyNgCthk7fZws4T6YrH7eZ5kIJcXVdr98Zx2YcNob553JBBJ1MgvMq
         BM/y93SDCX7moKJaxv82HnoIXyTJ5cTQJg7EOqbaYXX3q3pf6H5c0Yv5IxqjbqmCXyca
         XglPVk20+qlbun+Fzztc2/Ss1jl7e+czktcWN4E6OyPWk7zhQy8PTXyQA5OH6Gkegbru
         L8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWDGDx+4bzEpvGN/ehr0gQh2Xed2A2bgxfZaVI7KujkrN6re5Q/scA0l/3hrx0vcJ5jluoD1EALMzfGqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvlbzrgt+9P2/XAIZIVRXtJIjYeruGEUzOcAqp0pnroztyAXim
	AMs/JLw3OMI8U0TXC3VTFtJ3BCP7QNeXvEjj7MhG+PvCklDgNjYh2lVWO5qSxsE9WgBsGN78hmG
	C2z9n3Mj+z9JQMivHoIf5vQ29ou6GZQLCAJPRbxn4hrdwY7qb+kQ3ojU7EHK0xWYkgg==
X-Gm-Gg: AY/fxX7eb7sMnrAc0qRuzNMFq7QcLhewoJbE/I3979FaTXmSvD9EfGvrLrzuInsrdMp
	liNeZnGvF9pwLuO7f/CviDPytu4jXKcCuh/p3CF4nbQvlrE2G66gtbS+GEZ5CtM+oxgO4ZNswSq
	jOfRUVeO2xNn3zD6NkwiQ4+ADsR8FPIMW3Utme8/J823ccsYzT+K0h2eJBya1IdHz7XeTe1sFRw
	pVeiwj0kyKbdZQTQuQZDlBkQIkriQmC4T3j6JqFeBXuierPqk/HjiecF6Bi7f6MinhnLEGURI2D
	/NB9otRWNft2dtBY8ra/rD9tG7h2KD8R0TGl4A/LT3yMOGokOjY/VAr/9bkBzqqYnQMSmS2ct69
	I6EkE9RULsV/4rjDr8zadRidZdNadv4DgOLgQmF/07M4QE1kWJUVxvD67FFiQ
X-Received: by 2002:a05:7301:2e32:b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2ac303a39f1mr6279606eec.25.1765789653574;
        Mon, 15 Dec 2025 01:07:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/SAHT8Ytx4P0NslkI8VVzhLetyY4xbZOEyA6uOZdbqyTzxiSQf0PxBkBKA5HTE9XUvmW7kg==
X-Received: by 2002:a05:7301:2e32:b0:2a4:7cb9:b7da with SMTP id 5a478bee46e88-2ac303a39f1mr6279584eec.25.1765789652960;
        Mon, 15 Dec 2025 01:07:32 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm15439671eec.0.2025.12.15.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:07:32 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v4 0/5] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Date: Mon, 15 Dec 2025 01:07:20 -0800
Message-Id: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjPP2kC/3WSzWrkMBCEX2XweRXUklqWfMp7LEto/XgsktiO5
 ZiEkHfftidksjB7ETT0V6Uq6aOpeSm5Nt3po1nyVmqZRh7Mr1MTBxrPWZTEc6OkQlDSiMdxFmm
 twlCyMkOL1mDD2/OS+/J2KP3+w3OgmkVYaIzDzjOr97Wh1HVa3g+/DfblQ1p6dZXeQEih+xSiC
 T5DgPup1ruXV3qK0/PzHR/N7rCpb/yfm22KcfQ2Oe1dtEn/B9c/cJBXXDPuUkyoeokY1Q388xJ
 4yS+v3Nh6SX0trDsdqiwrzjE+PBKNNNNT2bUpeMggLYZkuu1SHa1xODBJCaXso0FeMeRawxnAQ
 UDK6Mk42waCGJqfz/PlJtltzzCnKLTHzJlkAuw77unGOuyFf19sjiWLeXgXGrx1QQXlwXabuU3
 qw6hOUYQypjKehbdZtZ5b61P+wo4PsFdWVv5PhNbqKE0ItvWWXRwSYO4ptK1JhC7q1gFytZ9/A
 cBFuUqUAgAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765789652; l=4540;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=HsVd0+ZsludRLKdBPavQwwwUogi0DIXtCeR7VoJqTbY=;
 b=oI6YQtGZXqCrKD+8KI4YGLQpXy7I1rL/X6aQLa1YB28NdE0FEd3wpmWyUHJIQMl6QJHDvQIv6
 aSgYrabcOhrDo1PeR3+livOAOMySojSkP1HJSIvCjMcp+18afEw7rT8
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: PMpNjlnIURYFCsr4In2OoSFl_Bc71KiM
X-Proofpoint-ORIG-GUID: PMpNjlnIURYFCsr4In2OoSFl_Bc71KiM
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=693fcfd7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gM0UU-Ftw_ySWOd6apUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3NiBTYWx0ZWRfX7HJJsb8Ml4NW
 7SI/B58O0p259rAL/WbSX3VCVcRFR1QDVrf2hKMZcQZ5MM7pibt9Q1z0KpUlTymy40CNhQQa3GQ
 XvDGZjdBBrDFIkmgYYpW437ktZjLPzRd+J7Wp4lEPbsiUaxxNu36icM3M41JHRtqHlxsvd/m8FC
 jt5WZiw4TF2oebnM9eq1e3JBEOdnLWJ2DsRpvD2f3hhN/uOrNOgPOWtwRJD5bHxiNgXo34jdSEV
 ZSfLrXvFoYmYIc0Z2EZir9I1s8dWkeyVimBLi82BD268htfWDHvM4CjTsZibdGmTKCW2ZYPlOfx
 0w+Th/fc9NKg9x0ZFf4EAA5n1G9Z837apHudA+n/znzd4Bcsm2vMWZusJemZ2Kcbo2D8rtjLT0J
 lXctLAwF2mnhXJs4SkdKoiTVyqjNyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150076

Introduce the Device Tree for the recently announced Snapdragon SoC from Qualcomm:
https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5

Add device trees for the Kaanapali SoC, MTP (Mobile Test Platform) and
QRD (Qualcomm Reference Device), along with the corresponding defconfig
and binding, providing initial support to boot to UART shell with UFS
enabled.

Features added and enabled:
- CPUs with PSCI idle states and cpufreq
- Interrupt-controller with PDC wakeup support
- Timers, TCSR Clock Controllers
- Reserved Shared memory
- GCC and RPMHCC
- TLMM
- Interconnect with CPU BWMONs
- QuP with UART
- SMMU
- RPMhPD and regulator
- UFS with inline crypto engine (ICE)
- LLCC
- Watchdog
- SD Card
- PCIe(enabled on MTP board only)

build dependency:
- gcc: https://lore.kernel.org/all/20251209-gcc_kaanapali-v3-v5-0-3af118262289@oss.qualcomm.com/ - reviewed
- ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/ - reviewed
binding dependency:
- pdc: https://lore.kernel.org/all/20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com/ - reviewed
- pcie: https://lore.kernel.org/all/20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com/ - reviewed
- imem: https://lore.kernel.org/all/20251123-knp-soc-binding-v4-1-42b349a66c59@oss.qualcomm.com/ - acked

For CPU compatible naming, there is one discussion which is not specific to Kaanapali:
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
So it should not block Kaanapali and we keep the "cpu,oryon" compatible here.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v4:
- fix node names in reserved memory
- standardize the coding style of 0(0x0 for address, 0x00 for pcie bus range)
- Link to v3: https://lore.kernel.org/r/20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com

Changes in v3:
- link bi_tcxo_ao_div2 to gcc node - Dmitry
- fix underscores in node names - Dmitry
- add reviewed-by tag
- Link to v2: https://lore.kernel.org/r/20251204-knp-dts-v2-0-596d8398c6d3@oss.qualcomm.com

Changes in v2:
- reorganize patch, merge initial features in one patch
- update UFS clocks in GCC
- fix nodes order in boards
- enable CLK_KAANAPALI_TCSRCC for clk driver change
- merge tcsr and tcsrcc nodes
- change imem fallback to "mmio-sram"
- minor code style fixup
- Link to v1: https://lore.kernel.org/r/20250924-knp-dts-v1-0-3fdbc4b9e1b1@oss.qualcomm.com

---
Jingyi Wang (5):
      dt-bindings: arm: qcom: Document Kaanapali SoC and its reference boards
      arm64: defconfig: enable clocks, interconnect and pinctrl for Qualcomm Kaanapali
      arm64: dts: qcom: Introduce Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add base MTP board
      arm64: dts: qcom: kaanapali: Add base QRD board

 Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
 arch/arm64/boot/dts/qcom/Makefile               |    2 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts      |  754 +++++++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts      |  712 ++++++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi         | 1606 +++++++++++++++++++++++
 arch/arm64/configs/defconfig                    |    4 +
 6 files changed, 3084 insertions(+)
---
base-commit: 4a5663c04bb679631985a15efab774da58c37815
change-id: 20251204-knp-dts-4ad60e175645
prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v5
prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
prerequisite-patch-id: 884f356ecd7f8046636174f56a6485a4be2e5cce
prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
prerequisite-change-id: 20251021-knp-pdc-395e2100d15f:v2
prerequisite-patch-id: 91797dc6f0e455a546d73254df87fc0ca22aa142
prerequisite-change-id: 20251124-kaanapali-pcie-phy-31968b2b2916:v4
prerequisite-patch-id: 265d61c5de05beea27297c10299239faeef55816
prerequisite-patch-id: 94e3936a21c0e19e5f1990a5cddcb1474b9adc95
prerequisite-patch-id: 69f436a719908a2210b4a4074a0b92bdfef2efd3
prerequisite-patch-id: f0c39c4a4de3b45a66ec8916e8d86a8ad059ade8
prerequisite-patch-id: 389060752aa271d1016ec115f19c0edfd1f831f6
prerequisite-change-id: 20251123-knp-soc-binding-96e2798dcfde:v4
prerequisite-patch-id: 789208c9126c28643c289754cab1681ef3bd396e

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

