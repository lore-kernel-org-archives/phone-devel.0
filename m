Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199C3CF69B
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234651; cv=none; b=Q+rtQ9uQo3sVX5JWgFjCy93Tx7SFJCHxLa++HJSgaEhyQ2RoUzJFq4e//H5CvLvJtwwEQSCyh4N69p37qzTx4ZJNuuob5+QizXjOJBCuZW25L5x3fOcBURQfTy14uqAoV4jXBQmK8BVHFqEhAtzlKhN7DnlhgvbncD2iwys1kz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234651; c=relaxed/simple;
	bh=WcFI7fW0Pcq6jNkDjMXMqVuX9O3i+aJIuxhJa7yzRNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6KcE3Agx3IzeBVNQin/JJAqHvDM338KrShdhXhdLux16TeDZMFhBxPv2Bz3D65D1CljKq2N1fBnT6UOq1qYDHyZ5XdXpVJtNpOzcB/skKzKRVYhqRdUgaTOuwqhIQ22hAWehBMvn+4RTT9hnwUE6rDDpBMddZzQW105AzUJt90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=gY1kgvcM; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="gY1kgvcM"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so134083066b.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 09:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775234647; x=1775839447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj/bpUOlSRd6rW4jWC3OLwCcjT6pqLJzLSn9zcAFMO8=;
        b=gY1kgvcMOmkjIc+Sw56go0y7rwhudlay7EtDsrFhy+H4qFXlGHr0WBggzLyVvDuvr1
         gz1AdL58/NRuLeilGLT+OTCvHsa59f3SQfG3xCdo71aLdVgvTcezuJMF44l6bHDfxgPm
         yy4yfUXxThIBLSmz79bKlqDAwN7YSg9k2n495eEyp2Y7W6hUO09M5kabfkc2B67OWEjh
         ND1m1gwgHbr8ecQkmVG9TzJdl+nzyYWw06MOaT1EAzyuuMcF//aAZxK0BSPSOYiXRYnF
         jQQ7y/HIJYB3SNBBL/qzPFvYk66cB2PHfTetbCcojZjOxgpSpbn9rJP+s6kZJt85Eo8H
         ISRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234647; x=1775839447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aj/bpUOlSRd6rW4jWC3OLwCcjT6pqLJzLSn9zcAFMO8=;
        b=bJNtEa9WcI8ANdv0mBkcepsnPC4KDsL4PcmBKMaPCkwreGlwQro1H+2M5myVAod+H+
         DeC1vKJiZePGZ66wSbfXjApdrCPFSGijGtcApAFIzpHZzXFvYF9M7CrnRFP5vYpxzhZ+
         QaO7se8sUuZItgpv0c0nOTlKei0ZrnVWrHFb/4d8HQuPBbtYhcYT0R3I31nbq5DG+iae
         lkK1Lak5pNNePrOSKbBwSPPkMyE7E3kNPgTZcT94yLjx5LyKL+JpLWEItoylAp3RK1uB
         N/aXrA4hkjjItJRv+DhyOCX/6NuAyaUUI5h0qaAxZ4fUBagQjVKTW7q6atRDZcHTERVJ
         010Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXvi84kS/Pls4Fjfp+AzrBay2YsbJbhWtJGEmQF73ds2gu9lOqo08D3Q2/I5+7bGFo7sSqlGlsSCySIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp+WlSkxA+m/00cuFSuKOqH/u9JKT6sNjaSxgUJf0h+ISrDqiv
	jOr3nlCFHT9XV/Y19G8Mk5KavMV6fQg9J8goEN6irpPdfNjV0NRcNaKEIzpAkcYooBRCLfFgZ74
	y9bGlZS0=
X-Gm-Gg: AeBDievWesM++gC854l20jyyACfsUaLwxPnD7bj7IHTB3prg0mROS1d82wUOlLSIgGF
	mZLHiVKn2X3LTKKncfwoETBwLXw3q1EjQ/BP+MCVAgMe4qENjQH6Bc4dIJPZUKjZZ9Qe8xRTzYf
	il4yOtmW8gexHn1EQLYH2nVZMQF8KIL7b7d+nn+4dcIxFEjpR5cN4B0QNB2vsgSBtzjWOw9WFO7
	Wz1ch3fErW/8CixdCv8tYZvrijCoK8lnlxNbtDJ/b00V+bX9+T9TEzT0Kq2GOVLxvX2Di6QCyz6
	5YaTskEo/4bWH2y3XEnPNwAkN7rSt5Ejzy2pxxtOTlDPrWItAreYv2yJUTmVsiQl6m6OAsdC1xB
	aOdbAXZpJBHjq43AJQXjXqEThMiPspNziHtQ+6tmpLghRjWK2k9yCTnO01qW9nNdQDcHBpEx+AK
	LT9/V4S8qS5RAEACPOYEhXCwkPqgvn0mwDtDriAlM+cK9qZ+m+k1szIutEROK+wfPi02iIxWcU1
	Fn3oYhjx+OiWKJAeazT1X/PgytSeWkyTvJWqawPy1qilgof
X-Received: by 2002:a17:906:9fd0:b0:b9c:24a7:510c with SMTP id a640c23a62f3a-b9c67447fcemr195777866b.1.1775234646571;
        Fri, 03 Apr 2026 09:44:06 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3ca9a145sm213492566b.25.2026.04.03.09.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 09:44:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 18:43:51 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775234639; l=1967;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=WcFI7fW0Pcq6jNkDjMXMqVuX9O3i+aJIuxhJa7yzRNQ=;
 b=mMufU+3O/8xMvtjbv05vIQqfZ/0FU/w1WUouJKeI15nIlvTAkcK37zXpUG09vOiAwkgrSzdL6
 0+ESErF2sMFCRg9IUwwswYdTCnwqqBAq2SLjj+ipyh4TsFUiADE8K88
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the description of the IPA block in the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 1c045743ef77..c388dacf47d5 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1599,6 +1599,50 @@ adreno_smmu: iommu@3da0000 {
 			dma-coherent;
 		};
 
+		ipa: ipa@3f40000 {
+			compatible = "qcom,milos-ipa";
+
+			reg = <0x0 0x03f40000 0x0 0x10000>,
+			      <0x0 0x03f50000 0x0 0x5000>,
+			      <0x0 0x03e04000 0x0 0xfc000>;
+			reg-names = "ipa-reg",
+				    "ipa-shared",
+				    "gsi";
+
+			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING 0>,
+					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&smp2p_ipa_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_ipa_in 1 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "ipa",
+					  "gsi",
+					  "ipa-clock-query",
+					  "ipa-setup-ready";
+
+			clocks = <&rpmhcc RPMH_IPA_CLK>;
+			clock-names = "core";
+
+			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "memory",
+					     "config";
+
+			iommus = <&apps_smmu 0x4a0 0x0>,
+				 <&apps_smmu 0x4a2 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_ipa_out 0>,
+					   <&smp2p_ipa_out 1>;
+			qcom,smem-state-names = "ipa-clock-enabled-valid",
+						"ipa-clock-enabled";
+
+			sram = <&ipa_modem_tables>;
+
+			status = "disabled";
+		};
+
 		remoteproc_mpss: remoteproc@4080000 {
 			compatible = "qcom,milos-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x10000>;

-- 
2.53.0

