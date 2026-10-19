Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A4838A717
	for <phone-devel@vger.kernel.org>; Mon, 19 Oct 2026 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391479; cv=none; b=u3Zr3Y9FY/N+Lk5F1m9wp02F3G+mahVbw90rq3T4rVCfU62ONMyIN6oql5wUnNi5MHTQRYpMWj+LeSdKVTHffqZFIInCLSkYfIAzP6xASbYzHaxOYG8lFCc9oYD18INxciBb2UE2oSLA8v0WE0Q2/eoxmVZOgCRzlm1YjhdkSgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391479; c=relaxed/simple;
	bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dPG049RmAQc2rHjazE93MHI14H1a7TYmE+gYN6eKJWHMzZFVNrDWiGCKhWq5IKrMaismQN5inPlRAbYB0qHEimlY0uby0MKrSD0S7Kzjne3hiZ1lDb0XWy5lp8eQjWYT2BEWTlG0twILFycO14mCCotYL4hIXVmmjRrCuALyMhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gB2mun92; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gB2mun92"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so1821255e9.0
        for <phone-devel@vger.kernel.org>; Sun, 18 Oct 2026 23:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792391475; x=1792996275; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=gB2mun92gI5039yDs820EXCenQU4tVDsv3Prgr8rZMNT5VsFeW/f66W7ql3eDaHDn+
         9i9gxp8FhRhOXLs6877qJyVC/oW1+EZnGO2u9NFBWrkg1gQ3HaHr3LcAxBVb5LUCqALB
         ssWJ8rwNZFAVKPWldDuYZahXm9JnKmZ3+J8voNQQC/HA7TGlTD+/ACEWeoorbjDIFuS3
         47mu+F3VTHYq90ksAuIyGu6ILJlJkElv5QMWyxVWN64lWYenwSkaxhAks3AXEqfCS8CJ
         /ufeVlIO3ghzlhRLrxD0BwzGWelv/1zMgfowJTTahr9yWgSxwl1+/fpbssSYrDiiA8B4
         2lSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391475; x=1792996275;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GCThCQjiUFY5+/PZUxZkIpMCNGyKmzi9/ufOgt9jdnM=;
        b=ZITglnaUMiWEt4MWVzEHzsTWvGD2+s3vBaAqugvvvUilEBYicIcTxh3IfJVqmg0noc
         42228pe3zz7I2L/ESIKN21fE0UV5P69ZO+XLfYcBKPckz03gkZqkMoT1JZ11NGSylPsT
         d95OZh2waF0KKkjdlbrWi4HzHw94VJXByvaZ9dVzTf7mMNHFQDD1C/zRDKv3e/2AxLpP
         dZtvCWMnL+5FMqGHT6vog42ZXDA6qM1huQPWALCYtTGTRZ7bz+htuzmIrlXK3R2NUhbe
         S3gRc0chGimUmy+Mv0tVlBwaI/o5QSrSKnHfVPpolgYym/YZkKGFu+uWALdIGbP8m7lz
         T4Pw==
X-Forwarded-Encrypted: i=1; AKwUvByyHTY+7alYY4ULPQhvu9i/DsngGmInGr527ow3aC3n21UpM8ddiIROAZS4BTqPB1IYvq2n8HU57C86kQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvKb/U2KXRBnzljjwiwA/sdif/177hixUW11n3tmLHGDMx3OdC
	RoGrj72bekuhmwedABGMqp6akzxxBjk6KcxT7nPb+xRNqo1r0YSytBXE/nB3s6CPepc=
X-Gm-Gg: AYBFou2jlfhgd/pVK+X3YPuYUzJyOfvRRVT3pZog5AXGfYlCPyZs2spvh8TMiN5bTS4
	TimYLmgbX5ZuGRJGXRysD/GdIWspaiMRb3qzUMDStgUKNZZ5cVxRklclHMOXqB4kH58BQ50JYBt
	DkvIgrnRjxTSIZsBhwn84yfkhnL8f+7hoNxqC7c/7+WxmTR8HXd43WGJk3pvOh2IcahaZsmq+Rm
	g+B1DqGvl/sZNK8yUu3/KBG+hLBQvoDtOWJtRHrmk90/EkzwF8lIXMSOeNK/Dl8DoyhS55w9jg3
	LlMayckZSnDbMH3/TyYEiVPUNBnoiKILUm3WmCeQqClW+LkauazBV0Xwaobl6y6V+DcQ3C4vitE
	v0D3nBOgDfRK6UrDWzKslKzNSvnXYjrh1ybJzLZVA5+kzRe+JDAMeXBCzB+rGMH/vNNorb5gL2K
	N4Sz+8yF/mvU8jUA8LMwd43u0W4uRLiu5Kpd6BIARGA+YU15QVyxfxcnjkCAh/msfADdsfkXFTY
	dz2XDBhrIQn
X-Received: by 2002:a7b:c3c1:0:b0:4a1:8849:17ae with SMTP id 5b1f17b1804b1-4a1c663b460mr166458235e9.1.1792391474870;
        Sun, 18 Oct 2026 23:31:14 -0700 (PDT)
Received: from [192.168.200.185] ([122.164.127.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm29269239c88.4.2026.10.18.23.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:31:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 19 Oct 2026 11:59:20 +0530
Subject: [PATCH] arm64: dts: qcom: sm6350: Add memory-region for audio PD
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm6350-fastrpc-memory-v1-1-1d4edb11238d@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr9LM2klakCJcxbAoddCatGCnGAzh7
 lZh+ZL331+BKTpiaMUKkd6O3RgyqJMA+zDhTuhumaGQhVZSNchel5XEwXCKk0VPfowfVHVjz7o
 21UWWkLdTpMEt/+6125nn/kk2/WKHEek158O0a9AbJrSj9y61ItCS8DjV0G3bF0qB9fmqAAAA
X-Change-ID: 20261019-sm6350-fastrpc-memory-179c467a5803
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792391467; l=1793;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=txq8RXRx0od5LxWggME7R2j18CbFPKPl0i4VxtB+JkI=;
 b=VEH2q6yE78YozhInji/DsMmhOONcl0mWskWd4bhyhR4rM3/IPyw042bVDiaHZPQLu2pvNLIXv
 KKDA0CcERGFBiGbXdcaCCFB+6gPQjZWmgFORriHY4/Cfw2G8WLopGiH
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Reserve memory region for audio PD dynamic loading and remote heap
requirements. Add the required VMID list for memory ownership
transfers.

Fixes: efc33c969f23 ("arm64: dts: qcom: sm6350: Add ADSP nodes")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index e0506fada32d..11c1df6e7a4c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm6350-camcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
@@ -689,6 +690,14 @@ cmdline_region: memory@ffd00000 {
 			reg = <0x0 0xffd00000 0x0 0x1000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
+			no-map;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x800000>;
+		};
 	};
 
 	smem {
@@ -1430,6 +1439,9 @@ fastrpc {
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					qcom,non-secure-domain;
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

---
base-commit: ad304bc4f861beeb20f6fb189783284e17557338
change-id: 20261019-sm6350-fastrpc-memory-179c467a5803

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

