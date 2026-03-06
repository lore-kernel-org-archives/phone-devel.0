Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1CE2DC34B
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 14:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805699; cv=none; b=g0wQoYbZH15rvMIyedLVyzDBvv9BIpcQxkLurO6TmOV5W499eDXpqdfAYEsAtWfr12/yKZ5/JpNipIwJIC2ZfW0E7YpeAt0mQ47w+bfvOt5h6DvI/+mAx/lgoOkmrxaodZoC9Lqkv81kYQu7XuNmRbb1jS6ZifJB9wkQxAAM+58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805699; c=relaxed/simple;
	bh=oNf8mjFA1GbQV70M6U4bZQbgsBwYwBimof+pvRp6x18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPazaZCAGUTWvUMYzYXJ1wDBUSdVAJBSrW2FABVSJ0Txv1VPl+BL4jHeoPNDnmIAND8Zck/m4uNqmjS8TkAWBI51m4O5hPQnKz85cB23eamIwQTzmzmeezZb2O8Ag5Mht3bfDiSB7iw48XksrI3BYolEBLLs2qaL10IXezX+stg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yIOvWvFQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yIOvWvFQ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b941d924534so143153466b.3
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 06:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772805688; x=1773410488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/RRoRU++tB3z2PVmiWjOdu3p96Q4S+zG/ktvjfqzJM=;
        b=yIOvWvFQJMejICLKbe9nMzyyZlCZvXZ7kxdcPmeDDhSyBQCTUeo7tSU8hJEnC+8a9m
         YtUE9ryI/dGlGoMVcJNQwIc0Wa3Ry+655i2RNIjniBWaD2YCBWN8SnooXNd3v6sEg3gn
         Rvt4yL6exR3skEj3Y3IDTvDCZXI3HIv2hvtG+xNVXropTvj6KRPMfDN1yhHqXbDVEkWS
         B/5lWB1u61Ba6t2nm98s7Ehpf26Gfrg+RApFbEp9Uw+QvXe/DH8Egw6CTD27DEOUGl/B
         EClt7Di1evfxw1zhC4PZxhAh2raGPyncsdAmu54VsjtLgoSZGDHYyW2gqiTyFdVrnTWf
         f7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805688; x=1773410488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/RRoRU++tB3z2PVmiWjOdu3p96Q4S+zG/ktvjfqzJM=;
        b=K3WgIdLO8LdxRLTQzTYi7CkxiqUfGFADADIr74+7jBkenLpGXYiyv/dS1YO2E8POR8
         2aiu93wtWND+/kn8OaVQrpJhuPp3zyKb7qG4KO3EHKG/zaBJqnSLVhgRWrDM+bKIOHaN
         3829RfUTBfZZRPv0m3MSugawV5JGe55P30HQiPnlGKjhTaRj9dIN/ERzDpjAmOWHhypv
         oAb558U1YQdUbhcv0nbIVEY3Gvpz36GkvsrrnBYm4VUXKRFBy+HVUCgnridAzHfvhCIe
         yLl9osaiuwc/k3uOhlAvXdVQcibi422A98EDVxIzAnLBCae5nTba/45f38Of5mBwY/wC
         ofaA==
X-Forwarded-Encrypted: i=1; AJvYcCXCrb6+piu5eMn4sQFvJf2qzFDoVwKQjbUrR6nDs7BlugpXmtOUmuzNTPyvIEgF3yLydl1a6AQ5fscxsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZdxkzPyuPSy9kgN+SSBIcqzZhHmEMN3Sn5x7IHrajFFV+Bz3L
	tU/YyX0AQP3FaOn5Wr5A3UgD+fC9s/hXxlpKPnpXgkz5Z04CFgst5gU29RapDd0lvWgSJY8jxtW
	axydH
X-Gm-Gg: ATEYQzxpIK/GIHbrSLsWzvQvV014DPArWxk8aNgEEoVMcbW/7Ux02F8hujc/uym9QRH
	htA+0YEpyApFvAsDpqUZtjdCu0i9TBJj1RWYD3ENORjnTWYA1nng53dIUepueqZWYNTXITLqT05
	8SNfeRmJ17DYmQJIumRa5F6jOyV4EiXW4VbT0T54T4mgXvV6txrhuP2DdbpPCLD80eZqeKJ3cwQ
	SSbjySeCZfTF+euPcRXnktqEvj5041KmK392gEC1P6tJNdSeQGldCiXAY4UtRt+5RdZLwGxIWQL
	XTdnXZzI4QD0Lz1wuNkcc6IXtCaMqQLsOgJAVznQ/gtgsEt0H8lY7t0j8Tdc6k/G5CXbMuZAe0E
	4b9bKMd1LYYRkNdN0H+7GgKwW1d6tEOa0gxOzOIGf4DqeoZxR/yG7oUcT9EWK84pCtmYQBq+exU
	MRUWUFgzWIVQkXA8bm6woKheHv/TrsgadrxSTd6oKQVJ4QFC+GNkttlzBkH7KWrVth2nKt88LCC
	9jFCXaAgdJ9fz8=
X-Received: by 2002:a17:907:7b8b:b0:b8f:8660:3cb4 with SMTP id a640c23a62f3a-b942db8aa4fmr126537766b.8.1772805686438;
        Fri, 06 Mar 2026 06:01:26 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97be5sm4313828f8f.11.2026.03.06.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:01:25 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 06 Mar 2026 15:01:20 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: milos: add ADSP GPR
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-milos-fastrpc-gpr-v1-2-893eb98869ce@fairphone.com>
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772805682; l=1907;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=oNf8mjFA1GbQV70M6U4bZQbgsBwYwBimof+pvRp6x18=;
 b=yIaTLUyI/HEGMXSPzzklPyfouzkUVLkoVgPkkDCtWfdX3tmLN6wwct4EfRDq9D3tbAsm9ai2U
 w8/9Qe8eb+GC8aCuRybZ4EZ5jjkFLJGGvEU5Gf47rnyWoMNORnV7TFq
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the ADSP Generic Packet Router (GPR) device node as part of audio
subsystem in Qualcomm Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 83a454ae9bf8..5691eb2dcfd0 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 
 / {
@@ -1263,6 +1264,46 @@ compute-cb@7 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x0>,
+								 <&apps_smmu 0x1061 0x0>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.53.0

