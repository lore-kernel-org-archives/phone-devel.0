Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3803A1A726B
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734685197; cv=none; b=SBfsGZ5gjUvSJv80upsQfFAYd1NYKQhxVMCbjCAwA8XX93h0/HGhqJLwW4on4UBnUuUEEdoO4VII/hSFjEViCbDWgydfxafddtFRidW87B2sZIG1Mylt3t7/ZtdeofVAleqJqqwbEE9XSbByT3cXlzuCe3Xu9CahxyUnByU3tqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734685197; c=relaxed/simple;
	bh=B/CSxh8bc02YGzxj4Cp8fAYbQzfHZ0MyOHkF9uHAlPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nYKbrh4ezjb3PHE/XW1x8d5RvnfHtt6D+UtkZ52sBky8QPmBvp3rclfszD+XaKYlza95ck3SMUwnPlHIIMK1ZTX7CSjgEs0gmwoax7LgeKU4JSRqFUOcg/l55ifovo5btSoC/JMtNTLGsJ4e1qtbRN8Gt8IwIw5f83v7McPI6cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=srA+c5mv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="srA+c5mv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso268715266b.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 00:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734685194; x=1735289994; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AvLjk+c7NI0W4wMRUe8v0vkFjUGPpNKl7JTlpY6nKSM=;
        b=srA+c5mvSf5bH9gWc20ubWKiWy4hWZUtrPSmLYZE+W1mCrP7mP2V8v+KmNj0qDBAza
         NZrudquBDpd5p+vy4Z2LK4MqUU/9YCPdi/7prh7cZjkIFTNMAGdfcScpUlwfXEVksere
         xZ6QA56KqrZAvzU+KnscMXM26sNFQnBiuKyaSAlS02EUEK+4HgAz7WbSGyftKnhVEvd5
         O1+3hjgo+M6zsg8JJxxyYuIpgM7JBKrDjpyHdw/CaOCWh9exAlixjWLoMkn9zIdt2XMD
         BSOv6TuPDPZqUKYl96Gc0NdrdQbU8fkd6VQAM6dkYSKA+jdM4cPS8v5JjKSlLTABC6Ss
         RilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734685194; x=1735289994;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvLjk+c7NI0W4wMRUe8v0vkFjUGPpNKl7JTlpY6nKSM=;
        b=rhMGpennMSPVxAhiQFEJWx7liWeZYNJgsA9UnVaa2W4mxojtlH1H+hEUxCV/NL6VP0
         7owOsh4EJkszhUMnkz4YbLMW9piALl2qFtW6Wv2J2sau8xuLV3Eu8ql+N9B0GxESFgmm
         d+cVeFv7yuEHRlfI4Nu/HF4ltq0xrbuunKTUiruJuUYA2E4ohzl70wj7WAix0bFniZhe
         Bu9NCQYEmdhHdu9GGoiBscs2qOx01ZmMED4YDzOLqAfAjSJklW4bvhK6s+Gur9iTMmsf
         4Rzk1afQdGPdNwL0k3ineMrHZEw78GgS9lGPpi6JhVcnqwMKnq5oc90Te8KdRH9XyxWa
         vVrw==
X-Forwarded-Encrypted: i=1; AJvYcCWA8wnAvwbClrTRuwLbRIC1VyWHgd5LGq24zjvFTleybiUiUTRN6jzN7LwdSvFPb1l+uLUyNWz28GXkmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTrh2NuBC5vNdg5Hb7I7Zu93Lg1zbN0k0y4AJHBIbjr5V7pGMh
	DHzRZENZqe/gr1/yw10uEpsIBlO/vwiEiNTl6h9+Rav5z15iunFiXFM7Yc3mN2Y=
X-Gm-Gg: ASbGnctmMkupZUFbj3FEz6vNAUfgs17Mmd6l2ZE6Uqn2zgLqaXxeAUmW+aE6huzNXk0
	l9O2TptLZI4fjUwOVVUXWbkHGEqBm+Nhv8ibvky9A7QEOBI9CluVCaK7HoPI3/KVvVrCHJRL7Hp
	1EnTGPtEVoY5eXRQoUBmwLEq61LNjB9FdA8k20uhfzUSyUkTxFXSjt3Qga8t2RrbvcZ9/5JcXJC
	aDJJ95NAqXfssR26sibAp0JkoW5tbOFzMp3MvRsewEqUGH4Ld3QalPZZr0C78eMZlS/DeRPZIl0
	Es0vC1k+aXcVJSZSLRKI9h2vm0UJVA==
X-Google-Smtp-Source: AGHT+IG4raqmf5z3+Bbit2pptVJL+0AF6PrPFax/4lpRRdG7CllZm9cIM6vpTrrrMN18RRgqKa7m+w==
X-Received: by 2002:a17:907:6e8c:b0:aa9:1b4b:489e with SMTP id a640c23a62f3a-aac2ad8ea23mr156763466b.24.1734685194579;
        Fri, 20 Dec 2024 00:59:54 -0800 (PST)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f080c1asm151178766b.205.2024.12.20.00.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:59:54 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Dec 2024 09:59:50 +0100
Subject: [PATCH] arm64: dts: qcom: sm6350: Fix uart1 interconnect path
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-sm6350-uart1-icc-v1-1-f4f10fd91adf@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAUyZWcC/x3MOQqAMBBA0avI1A5kU8SriEVMRp3ChURFCLm7w
 fIV/yeIFJgi9FWCQA9HPvYCWVfgVrsvhOyLQQllpFIC49bqRuBtwyWRnUNPxgk7dUZqDyU7A83
 8/sthzPkDzf3AwmIAAAA=
X-Change-ID: 20241220-sm6350-uart1-icc-de4c0ab8413d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

The path MASTER_QUP_0 to SLAVE_EBI_CH0 would be qup-memory path and not
qup-config. Since the qup-memory path is not part of the qcom,geni-uart
bindings, just replace that path with the correct path for qup-config.

Fixes: b179f35b887b ("arm64: dts: qcom: sm6350: add uart1 node")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8d697280249fefcc62ab0848e949b5509deb32a6..7b5c340df5f6f32233f4254db2012f84bdde6be2 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -936,7 +936,7 @@ uart1: serial@884000 {
 				power-domains = <&rpmhpd SM6350_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
-						<&aggre1_noc MASTER_QUP_0 0 &clk_virt SLAVE_EBI_CH0 0>;
+						<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_QUP_0 0>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};

---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20241220-sm6350-uart1-icc-de4c0ab8413d

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

