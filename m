Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6202E1FF1B5
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422323; cv=none; b=hzwcpCsPhrzlSGJh5FUlOxNKsSFufrmNRlB6dtHrv/vU31SkAWySt+DNLpo/VUKKQEHaBQufTgCZ+LAxiEF56e4z7TIYQBIcvcucUlurKEOknQQZptIfa91a1eVW06UtZ/pMcPuWoEjEFbMedRDLGAZ/hTiK17jVUKMajzB3yjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422323; c=relaxed/simple;
	bh=N3/DKjgGAqerCM3U9yrqBVBaC/n3GFuLDfSTAIZTcdc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nAV6SVYJq3VeHdh9C4LmL7/0sJT8Kl1LEMimei4qoJOSfUyzgvo+xbcFklgLGRsCHkMIIpe/Tnqj7t7tYPzYDOPLuOitpqYmBgOYv1QD0i6aSBNrnlfBAvv5TrQGbjqNpFE9edNyBQ4MOg9BmjCgRZ1wN/CEydKKpLcO00CeQ+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdAjcQdC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbXgoKq5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdAjcQdC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbXgoKq5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALP8R13729540
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bKSwD5JLjAfpMEGfULybqU
	JyXW9y22pRgXB8bB8oZn4=; b=gdAjcQdCu48m6xbgl5aH4r8JcMiR/f9854SMjD
	nN1S3vmZ3XP1szthlIMR9YueyvctmunmpE+Tgx34/Tm9CVM3AX/RmaOp6zRns/Gj
	0GCQ+C5qWCPn6E1y4S2eOLEnWdxVzfMqmztSd02dHivAW2PijhbeEv/hcP5/vCvL
	3Pu5Qvw+OlIEXqm/IGpejh3TIKixhcPF16jpByYK7kW3f7mRaG9qfOGS+HFbdjJ/
	QFiSEyE0JMq7f2rcv4zV+4mPIBzB7mo3DRs48/BtrY4XVUAXVvRi7v8/ALx8ZP/6
	Je2uJBK1zE6Bor4+FKa+Srp2EKM14+SzZvVA8mi02OKRCezQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ayg0prvpe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 11 Dec 2025 03:05:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so544731a12.3
        for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 19:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765422320; x=1766027120; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bKSwD5JLjAfpMEGfULybqUJyXW9y22pRgXB8bB8oZn4=;
        b=LbXgoKq5lctov5pUSSv3lXCLPOtZvOvEl3OzRgThPqDEePELBhS1Y7eaZ22Lq5MXGX
         hrMUwwyTs8Sc/KGnbcIxcuNAHVqYli5r/zyzTIntketI4fvIV3mVUfAP9w3RPDWQ+c3w
         fuCBW2hUL1H972slWVYuSlvGjKgNt9X9oA038amNW0ue9jbOlnwqaxOPZ/yh2u5XGyvb
         kInqRRUsfM4TfYgzQajDQfxOI5nX062N9ksT50PaL/6IQGqOdIUVBcjWjdzfCUCZT7nN
         OaSw21I6wJDe0WRaY2K3KGPoejHLVfS9oKIOpMAngC0AdQ0KeJQLmTy4JahySOZOEUma
         CoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765422320; x=1766027120;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKSwD5JLjAfpMEGfULybqUJyXW9y22pRgXB8bB8oZn4=;
        b=HhdEmbIvJHE8pqyHpq2sSLZAE92PmQY0XrtpS80UW3JVZ2apsDsVx9U6zp6w3HLHy5
         60EBPWMJkKCFbF9pxDC0ebc5zRTB8Yih8bHKgt5jjaZnLKJfbUUJ/uNFgVgvEKd8EPqu
         FAS5lKoDRQFRkqTsVuLAA2a7TYczFF16KeX5eX72NkzziIIaW0Lh4DhlTDNaukKxzNC0
         Q5DrQ7MD8mZVHjfneWr4qPzPKGEBZGoadvVnUVaZCie75y8Rifpb+XeIpDl1wTW1nXLR
         xtV14whwKuj0p4J64PsmqWmThm/88Y7ozeLok08NqFU3Ses9uvEbxyqmQ9EN2nBgEwSW
         GJJg==
X-Forwarded-Encrypted: i=1; AJvYcCVmleIG0ydUgN25auWdoIX/tSsAV429zG3bR0t2GN3dyGoVi6qN7OzQAL5rIszZ1UqufcZMRmy/mHk2wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyozW7WIcQdIBFx2crdh0GR0WMDAY/2LMiP3grxwUoxw7GglWfM
	y9CM8ezGYL/JKmO/iuPiSTf0JMdDK+IOokOyIGONuQYLZC6iMbtjFSw0zfHhr4fiddrnnm/+HbP
	37WdbIycxqwenRoCQweSDZQdCjcEI8PR+GxBpcVRtBSQ+KpvHROjCWLLpUrJJIJl8dA==
X-Gm-Gg: AY/fxX5wLG3lHd27I1qhvuCxwdCVC2RjXcwg9E8w+6cleFl0EqoO+ls4R2dbYV2KUXs
	ioX9v0IiuT5Fjv6xizLKszez6bYeVeokbMTKzhwmdmMiljrJxNe5f9Y9W+cpVCcU/bKcvDt9lrp
	Br827IMy/a0PRDAatGXxbUDoghs3mKRbpPXLGQYpg+t0a8ZbDBQX8YJM3ZEb0lc8wur53a9GVEz
	5g6txhi5zGO9q9G1/6lfWZPusZgPWuJ9CUNpDypOx67jP2ZeJKz5fAZurxwTGDNIb0NdByaVIlh
	hIxt0LSCebVHJh514tnM165OBU1P2zK5Mz1zxre/cr1vt4fm47kehcBEcC1yPcBwHH5bVwEBuyg
	9DfRsYp8yRWsyZ0odKup6R7jzN59RBkrOibyYwJOO3MTK+44BI8ziqUoJsmZO
X-Received: by 2002:a05:7022:221c:b0:119:e56b:91e6 with SMTP id a92af1059eb24-11f296a3f95mr4052787c88.23.1765422319663;
        Wed, 10 Dec 2025 19:05:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdJJlB6CX6ovlOJ04U9oKy0A1gUL+ae4CET8d4ygpZUmPvi1Me+KQawu58xrjSxMu3cvEhPA==
X-Received: by 2002:a05:7022:221c:b0:119:e56b:91e6 with SMTP id a92af1059eb24-11f296a3f95mr4052746c88.23.1765422318984;
        Wed, 10 Dec 2025 19:05:18 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ff624sm3935642c88.12.2025.12.10.19.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 19:05:18 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] arm64: dts: qcom: Introduce Kaanapali platform
 device tree
Date: Wed, 10 Dec 2025 19:05:01 -0800
Message-Id: <20251210-knp-dts-v3-0-8dcd52f055c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN00OmkC/32R3UrEMBCFX2XptSOZ/DXple8hIskk3Q26bW12g
 yK+u2kURVm9CRw435k5k9cuxzXF3A27126NJeU0T1WIq11HBzftI6RQdccZV8iZhIdpgXDKIF3
 QLGKvtFRddS9rHNNzS7q9q9q7HMGvbqLDxldWbLZDyqd5fWnzCm7mFs0s/44uCAzEGDxJbyN6v
 Jlzvn46u0eaj8fr+nTbhMK/8B+bFV5xZXUwwhrSQVzA3z42XuPTuVY+faz93XjYtVTkCHui+wf
 nJre4xwRFgPMWIzKtfJBDad1/c4ybtk1aiEB7icaO/ZY2FHHZj82/BAJhVeTIWEA1DrXiP3Zaz
 mNtAEJK68kQZyj/QHA771eLhVKE5fACAq02nntuUQ9FXiZFG5ZnAp+mkKY9WB15b02gMcRPrH3
 3dt90GnaeE++N5N4ZJRQzngXHGJre9VVFL5zVZMa+/sPbOxP3eeeCAgAA
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
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765422317; l=4734;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=N3/DKjgGAqerCM3U9yrqBVBaC/n3GFuLDfSTAIZTcdc=;
 b=gvNG/lr8h+DYCeZr3X5Njxb3K/UYRYy9f7e4klNcQo+63gS/+DU9f8Pu0+bgEjauxeb3ZE4jZ
 RyHEHRJID30B7+eHjoCCOpTvXz9T62H4CTApHm2gW0UDLI1cK1UHFZ2
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: wnTj0o80CKzYy5JWnd-MGSMrB35w1_m8
X-Authority-Analysis: v=2.4 cv=b46/I9Gx c=1 sm=1 tr=0 ts=693a34f1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=bWsk7nGGAifYO06aIhUA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDAxNiBTYWx0ZWRfXwu15Wiy/dUmg
 sw765xddRMzdEAtUv4VH8hSnrikBbRZQAvv/znUizq2aJtlPhsrXd9xKfX8WqMuA0E6S7B7kt5m
 Ak2uaWz3tmaURto9LKmA98LhstlkHR9MY8QBQgLswQllYPTpIb09GFuqj7LInJBDhGW4l+uFw1P
 UvtlriZzuLJx3SSqRlHatN8E36dZ+UzQwAmdqfVa5RisWTrxn8P8fFjvDsCFiuWdfEg2MTpkq6V
 sLSoZv9wJ0RHdaWtNsikyGhxtlaBgeO/EzUFGBDBOdj6Lr0Wk/iOZgDPqJ8VbJJnObMhb4hgvaF
 Pyi3Umrp/X8JUGQcHHqaX5PkMiUK5A/G8Tcs5Va4KVIZ8k6oQggto1QxiK8F3yWC3KeuiEGqYnt
 nUcck+yCsyXuOCRPmGpqSfpllPRYMg==
X-Proofpoint-GUID: wnTj0o80CKzYy5JWnd-MGSMrB35w1_m8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110016

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
- gcc: https://lore.kernel.org/all/20251126-gcc_kaanapali-v3-v4-0-0fe73d6898e9@oss.qualcomm.com/ - reviewed
- ipcc: https://lore.kernel.org/all/20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com/ - reviewed
binding dependency:
- pdc: https://lore.kernel.org/all/20251021-knp-pdc-v2-1-a38767f5bb8e@oss.qualcomm.com/ - reviewed
- cpufreq: https://lore.kernel.org/all/20251021-knp-cpufreq-v2-1-95391d66c84e@oss.qualcomm.com/ - acked
- pcie: https://lore.kernel.org/all/20251124-kaanapali-pcie-phy-v4-0-d04ee9cca83b@oss.qualcomm.com/ - reviewed
- imem: https://lore.kernel.org/all/20251123-knp-soc-binding-v4-1-42b349a66c59@oss.qualcomm.com/ - acked

For CPU compatible naming, there is one discussion which is not specific to Kaanapali:
https://lore.kernel.org/all/20251119-oryon-binding-v1-1-f79a101b0391@oss.qualcomm.com/
So it should not block Kaanapali and we keep the "cpu,oryon" compatible here.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
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
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251204-knp-dts-4ad60e175645
prerequisite-change-id: 20251121-gcc_kaanapali-v3-ab91e1065bd4:v5
prerequisite-patch-id: 9a9cd779ee23419a023893f357decbe09da1e42f
prerequisite-patch-id: 884f356ecd7f8046636174f56a6485a4be2e5cce
prerequisite-patch-id: 0baee9ea7681fe6b4ab1c69f1e087427ad0050e9
prerequisite-patch-id: a7ee79adf85ce9c5aedca168a561a9560fa59b44
prerequisite-change-id: 20251028-knp-ipcc-6b4189f71121:v3
prerequisite-patch-id: 6cf08b941741eff023e37a6a8afd5478bdf0788d
prerequisite-patch-id: 0ad500fc45e104a874839181b5ae59a4867ba1cb
prerequisite-patch-id: 628073856ba29bc3ed64f801dda4c9c7d767f327
prerequisite-change-id: 20251021-knp-pdc-395e2100d15f:v2
prerequisite-patch-id: 91797dc6f0e455a546d73254df87fc0ca22aa142
prerequisite-change-id: 20251021-knp-cpufreq-3449bc8c2014:v2
prerequisite-patch-id: 6c96544a929e0633c39eec84bd77f872fa3327ed
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

