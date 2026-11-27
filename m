Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795804770;
	b=rOkZ+YffChIIMTE53pa+RUgQxvAL0q6KDBk8ngmVSaGvqMOyBO73xQ/jEwGMK05Acz+b
	 G2+ArMJYNf/hhfJ7IB83+hdO7INanEETpRIOc3/B6F9GlA3MZCQxhav2X7WL6Ns9hno4C
	 rvW+R1K0A2p927Ae1jmSGdkACe7MC+7iLxXQyopwwpRG0UAPzJSkuQxvDyLEXrp5iv2bJ
	 RbtEtow5jGTwmPH5AEO1BhxBc4UuVbKT5RcrAqMfNabGAtffzetcoVV9bgE67eBx4E2G0
	 lzwi4gH+9FR5mSc1LNnKFugZ7Jm6lMeW8ZE/n6VfPUpv8SEyeeOjZSTfgvxTDiTZNtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804770;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=vnCS2tc4S3Z1JA/7UaeuCnx5/3LF8e9egL2JnO+fecRtkg65CuobDZXxafwU/5J9QmCN
	 UKvpJZbWMRfhLeiyP/lFmgf7r1oL1gceoTHJg8bqvl2zrNZKqIQjQrwWHYgtmn9m9S5EU
	 E2X4wxLYkUnWjKQU64U9O2wXaB6EepeS1v/cFQKlfP52dIeKZE8mDLvpeM1wIcbSSDhDH
	 7/wHgfpFXpO4Rq3se3T09FPggWhL/72N1Aq7Mae06IvdmsRGuHQVneMf9MgmUT7V/br4o
	 punkVw++bTBJ7bJOSfRFUSCLE+/Yigk7E15VAMDaIWa7heS4lmo7PEvhuhfVxebIj/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL7UDRpE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48959606A329;
	Fri, 27 Nov 2026 18:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PL7UDRpE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795804769;
	b=zCi+Ma5N8hp3bLuk2liPusYdjzTYlHRa/7rVS2tKzJT6kSUI/C3lBO1zdUIRyqOn5jQg
	 /BaLMj2AhDOiG0Q9e16I44p9opEwZFOWWa4YvqJ/fhX6fvoj2Tom6Z5xUVpZsDmCIZ4lM
	 eKMeoL9ZIp6EZzI7oJ3aOmlkpt9beOb6s8B67F1rWrSBfRtG/XBF0GnbkPlcB+vwCHUO1
	 4kkF7AGXi3qbHVBLgYqY6r82me8U7ianUaAm6wR6J7U4o6/WI+jYznINPo8xU+DA5alCg
	 m3zKjEOzvNX3V4X0vYTIlqgfqqd/eoSNEAxyNix7w3n9FrCu0ILc/AXiE56tlBARlPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795804769;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=1HqZPgbMjbHmC5NN3vCQCc+NovlwL1KSUiVnUJSv8dBufq7uFzseDpbtENDPUhHf0q0Z
	 dU5YKuvZ5vHfpWz+VOtP8MfXodjAKEbj716HP6ocU4ti2pf/VwcmeIeUZWKshRi0rdvks
	 s7iL0IxTjY2Iao4dVgJz/p/zYQgRIyaAI14T9qTsKAZoBBwWnPoxGEtQn/fc6f+A2Li8r
	 3TuSIGzAfAQbUijRJcxw5DDg0r3ui3k4iRdbniSgWT1/BwNt/EfrYCfFkZBJWyQ4RUNa+
	 vcngZawfi0+09Prgp+s4LleWGzHHEyEoNNHEgT5pTH0sgpLY3BcbB5dQFX/LkvF9SQA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 613121F008A0;
	Fri, 27 Nov 2026 18:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795804769;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PL7UDRpE8ZziXwWu031+8npUM/nkz2UjOOznfwDVmzFn83In/TdMQ2zvAB2fht2AT
	 l+AzingKWnzXPFJVotwj2+a7e0OCGTw3fcuhDeVqIPuns+29mM4Uafw2mGbifzNfXh
	 is+U9307BIoi7pb+mmP/WZvi/xJrCr6DVE3Nn1ndm+Neh3nG+OHxaHmIV8ruPuHUQJ
	 SWNWmIX1+mP/ETW0zggkAeKntvQdDSUogdcMpteGASXALKRshKO+CeLYk98I8Z13bg
	 NfZwuXtkfEXKJzrra9W5oF8lS6VgtrXVZSkAiYGVW0YAciFaWIOmKd+BIdr77M6U8C
	 ryceNaKo8Hp7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E25794DD37;
	Fri, 27 Nov 2026 18:39:24 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Sat, 28 Nov 2026 00:09:24 +0530
Subject: [PATCH v5 04/11] soc: qcom: ubwc: Add config for Molokai
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261128-molokai-soc-v5-4-144801dfad7f@yahoo.com>
References: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
In-Reply-To: <20261128-molokai-soc-v5-0-144801dfad7f@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795804762; l=1024;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=9lI0GDLg+ArIvmjuhBkr6Hwen5svXhSHz+Z0e79/fbg=;
 b=HuXGpO0yvmljdccPWVpVOHSYakGBcOzJVXOoJXQz0KEk8cLuqIQ6yvOZ9z4f4sG+MaOG42AMY
 20xJdjeEVODAUtifAkd898uH+9vushgwSXkwKXBpzpflTOdhArVj7w+
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Molokai (SM8845) uses UBWC 6.0 with a highest bank bit of 16, like
Kaanapali. Without an entry, the display subsystem fails to probe on
Molokai based devices.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 drivers/soc/qcom/ubwc_config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 456995699fdb..7c1166c68551 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -130,6 +130,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,mahua", .data = &glymur_data },
 	{ .compatible = "qcom,maili", .data = &ubwc_7_0_hbb16, },
 	{ .compatible = "qcom,milos", .data = &milos_data },
+	{ .compatible = "qcom,molokai", .data = &ubwc_6_0_hbb16 },
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.56.1


