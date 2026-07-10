Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B525A3DCD9D
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675379; cv=none; b=ZKiyjM+0y41eLUQSvqitBmzwMFE20bT7L2tVAiwHc4IOnWi56KPr0b0I7XvjgfGly13SFw7iqNgrV/VMSq8qMSNF4uYMiPqSzxhl4J23MtH1N50VKlUvBQDp8O+LTN/kFMYWVVH4+YlOH/CSkMkWi0jTfIpWZpyh2Uy+X+W/WkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675379; c=relaxed/simple;
	bh=+1KKaNTX/P7/V53JMeGAGQ8XdMuCS7KUkR2X20QbUvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjmGbLJigufgpFz5aU2vCCV0bt6oqJ6NkUajVRlDTAuQYgeCaTds33uDVPJCVav/MOABbrTAYlnadsftPeF+DFfF1OqvcYpZdZtW7/hG0kKi1yr6CUvKAiGccaLos60dohtoJqSm780uvRBo1f/jnDEe5xpQJ6Vp/5Oz56p3akA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ULUXSBda; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ULUXSBda"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so87417766b.3
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675376; x=1784280176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGhNzdohMFEPYe7rGIYSH65iapoiPfmEbyHAub7vT4=;
        b=ULUXSBdakKBgzIKKDtxc9hO2VcEF5rjtdCxiQsO0LtNItmWo2M5wGx2KbkkVIy1M7f
         gSAL88ZJW/R68wXxoaf7+yHfwLU+L/jL/kJZLRdmcoxkOJcpeF6Mti2j4UlJKZTQUWXC
         QCOll0caRl/lQphqeVkQyXT6uaBMhFKD5JsPl2pOwAMTR6wGU7PNhJL/shSZ2MYNgr/8
         U4RybdnHk4/Y2gBvlCbY7eyXte29fra/4dVE/NiEPKiLHkA2rJD1sfowNMxMW15yh4cW
         sQmPlCCd3k1T/4redMfj4hhoMsnfeWXIjVsdF3V1wP0pz0QVR5QdVvVpHyTydkIYdKvr
         fYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675376; x=1784280176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eqGhNzdohMFEPYe7rGIYSH65iapoiPfmEbyHAub7vT4=;
        b=Czizm/OUfCnGeCOXHkWSxrZh+88bQS3eTZUxL6x9FYVThoq8ELf+QLKJn+0iQti5a5
         5pnLuobU0QEOCFc48Lky0kzUk0ZPtRwItSVOFaZO06RqsoCzlg4ZxMuKFHhus0WU6TDd
         3hvzxuWfK02ADX4LeZyKlsBPe77XCKcYtQ553nck2yR5wYjOeQKLj6rYfK9Rz8JdoFJp
         qYFE6eNO8WGfkWhXncMQtORQHgaYitVND3Fneo5J7XMKosJ8i4wipRijpDDRxiBmvptS
         AdJ/KxQjdNlqkvQBtBBDbOHKscOWkVVXIjaJguvPv6Hpxx+4qmptBB/tl0W+l4mC9k+F
         p91w==
X-Forwarded-Encrypted: i=1; AHgh+RrHyP7TWCFoG6nTs1Eijy9Nt5BGpu/6uTdUE80isp7fD2WeyZSa19d/RA0ywA1PaxZtEgVvogfoFgLa7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLXHjt+zGSWV8a69P1AQ33yS/+vB9MI5lYtrnWaXgqPTO2/lWw
	obaMuihZw10I+pGhEGvJ2mtqOTo+N9NRUjLuY9GyMd2f+a/j81u+H3nojBzyQBgX3sc=
X-Gm-Gg: AfdE7ckKwpT4fpa3T7WQz7qqXqcH+2srNaztlpKVjGxGEEJD3bRbwuxnBXfIjOV9AhZ
	FBDdXT9i5y5+2NkQU0/EQGvV1waTapDB7wNrO4M1yMdCOa5uvqw0PYiiyVNeUoyyzfn/gzbkaLX
	5by31B0ijoQb+5Ar5HJ7ywAUuJ97OXM41b41IpEf2olCLQeM+DBtTeemtGxXq4+aajFIYfFjrwH
	Cf0nb74TTM3APcgYcUm04upKgKrOokZCtBNpkdZ7XRzFHu7o3tZGQUbXm4xwz31cOYgR5Dpj/Dk
	LA/T2GLv+NPgftMotDVSYwdelQLDe3RBj9Y9x40Zy37afvV9vrg1d5S4iwR903jS4rN1Z47kB1K
	6OFFiA9CxbCBTNOn3vHrpi0TKuqIxxc1M6y1MO3AN+aYxeRD+ekB9hn0Df1nB5DhTePX4daoOsS
	s92u4tSTrt4+6E0o11S4z7fIah55exjTF1u/YubyVia/pABzG8x5JsereXL+iz5JegDnZtiwAoD
	C4fYg==
X-Received: by 2002:a17:906:7303:b0:c15:dd38:7f26 with SMTP id a640c23a62f3a-c15dd387f5emr361970666b.31.1783675376105;
        Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:55 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:40 +0200
Subject: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=931;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+1KKaNTX/P7/V53JMeGAGQ8XdMuCS7KUkR2X20QbUvM=;
 b=7KzlagRFrXe26etPJVuOlzaav3hBDxk223iegLY9WRmoMroFHuylAyvI6EIEvhMaF09DPfOs4
 kH+zUzLWvF1DPyPHaQf9La7JjzSfvsNwTKQIMTt3BOFTQ5qTJFmhAAa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the OSC L3 Cache controller node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8c9232988953..1172a4f6adab 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2639,6 +2639,18 @@ rpmhpd_opp_turbo_l1: opp-416 {
 			};
 		};
 
+		epss_l3: interconnect@17d90000 {
+			compatible = "qcom,milos-epss-l3", "qcom,epss-l3";
+			reg = <0x0 0x17d90000 0x0 0x1000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_GPLL0>;
+			clock-names = "xo",
+				      "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		cpufreq_hw: cpufreq@17d91000 {
 			compatible = "qcom,milos-cpufreq-epss", "qcom,cpufreq-epss";
 			reg = <0x0 0x17d91000 0x0 0x1000>,

-- 
2.55.0

