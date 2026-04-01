Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8FD3EF0CC;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775083180; cv=none; b=ceOGaSHHvsah6+W9SGE8oj1qhtIViPJXJXM6U+LhG5BJW6dRVcHmMMY7lJsiKrgs5kwtKPGTc8lCOGAy6KKuogXUMBM38lzzyf0QvkOOpOktuBCnFKW92/4oAtajNLFsg/jbVZy1awy+kBoG0MNe3XV22v0NhSk+ja8qeofOhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775083180; c=relaxed/simple;
	bh=+3IVt1E+BzUQ1QcVG0scDrNeFg+bYzOqv78h/27GnuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+L1ja2IKC5+eRdRF2hhTIlvWEgT4K2sUJZG/SnyJsnz2PDCrqLwLttvTXcolThiw7U+WmpIcCexQTex3+uCqKdnt51g6hsXUDCBN3G86ZUJ6p3Dmwm7ABGkvaCjNN/cJVJRCLtGzG+T8tWM8wdlnJZfYfnercM9Z4dwKjLVzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkVAiWCR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkVAiWCR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33F62C2BC9E;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775083179;
	bh=+3IVt1E+BzUQ1QcVG0scDrNeFg+bYzOqv78h/27GnuM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LkVAiWCRURA4Iwan6kqMZokOFpp+n967c7tRMGVp4NZ5Cp9SGeuxcI2EQnI+BRp6D
	 qTwDcLqifB/nQJCJf1e1FEP2FSU+2UHJNrPoGbEyEKb4bMS0kKXILhe3667VZkLaIB
	 oF8QxeumNzF8vbdOIkiWHSqzw85i8LItp/9U0EriXBahxyk119xkTto5ayaY9vBznc
	 SSk2tdkTjMnSuVlK4+DRcUpgvy18W4WONvP+RpzBX4gQHmASOy/ekqqvlZrapF7zDD
	 AJFmWM1JsFl3xFIajHRCkWh4eytjNB01CgZxlSGr+FaZTUqlc5PhijwHjFUQ31E+K6
	 Epr7dqpSazRhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2585F10FCAF2;
	Wed,  1 Apr 2026 22:39:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 02 Apr 2026 00:39:35 +0200
Subject: [PATCH v4 1/4] arm64: dts: qcom: sdm845-xiaomi-beryllium:
 Introduce framebuffer
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-beryllium-fb-v4-1-46170004da28@ixit.cz>
References: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
In-Reply-To: <20260402-beryllium-fb-v4-0-46170004da28@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>, 
 Sam Day <me@samcday.com>, Dzmitry Sankouski <dsankouski@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1031; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=SnKFfm4qN/M+jaL16XHBrfpNpLQrOoZvc5aNlTISLv4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpzZ6pIQWxrYrx/NFNb6Ln1S8wIwupaP7AXCxrN
 imqOq1XikCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac2eqQAKCRBgAj/E00kg
 cr7RD/4qyNhIDXzRJORhXEp9rhsDhjnSGS88/9xAYH/3SLvFwqFIJJpF6Pd2dJfdYkG6UKQdtmd
 iBct7yMSbcOAMYUazlMz7OphojQGU3bdn3JtO1ILgmRYLbYSqVyorr1FgfZ4oyFgy69lfDbkfcQ
 1BsfZ07m+i3UBjeyzCKd30V3ys7fsXbDsXWvACSMCa1VeZP2newDGm0mITUB1mHm/srr9lAlPSl
 BKl+zKgANgEp31V0tC7JUAfr3CeC9sdhMOc3/DX7p2bffElqGwIPUduAz4wSU2zGsUwwnLJYhad
 CygeZueZTo9PonudTbZUil9rgn7FYRjUdNRDu1qPAse+rHLQcK2Sm28f8DsZrGII5mJRR3OiBKS
 RH9hM9tQCFC2Z5tvJV+WR05MQx57noemZlWwjxZY7KIhy9tZlMhXuUcTH9dLgA0MKY29uR47/XQ
 BsTI1+lBa8398HhUeC+d3eBH+E0tSZa7HeA5rxqjJHF9QbNwZM1+KZC5pdp5pIHBKpLREymCmTV
 3NGoz2apyj3pTFN1rRqju3nVoE2gb4ARPcdj32Zum6C+uOLz6qEt8bsMQSdVPXzEJLaL/MJ4SNh
 xCdwc9/mr6b3w79LvLvM4nCdzFQzUyLfZd9fnXRGGeiqe1gND1e879OkBq0IjpTxKDOV/zOY9KY
 Yn6rRGOuMDQgzUw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

Add framebuffer for early console and u-boot support.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 1298485c42142..a6ee3dd171def 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -39,6 +39,22 @@ aliases {
 		serial1 = &uart6;
 	};
 
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			memory-region = <&cont_splash_mem>;
+
+			format = "a8r8g8b8";
+			stride = <(1080 * 4)>;
+			height = <2246>;
+			width = <1080>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;

-- 
2.53.0


