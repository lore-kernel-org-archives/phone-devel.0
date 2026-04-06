Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9318BC3B;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775452619; cv=none; b=Rfk9uVvs4mo5rfzB0AuwxAiN+LnAT6mWfyP/alc4tO+lByG+9LCYkX7n2L2MN1G7H1y7MFubTC2dF2LKFEjP3ejF0JiEZleZspjE5b/m56Wqvsudjz0rK3OAwHCuYzQ8Kg0UltTqZJzHwvGW6JKQ4okAixB8Ruk7iQSUnNMMnkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775452619; c=relaxed/simple;
	bh=7FBGHZTJRYu7L1MZ5c7P0lIeIwAGCDaS6zXq3pgU3Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C5FQykme1nlYz9D1BH87oRqKDMElS45hrp1+50ItW+KKQAubNlgPhp+3yx9BBV+8ooRcuuhGRPbv7+sICthBtoUy6cQ7zLo33Xsl7AZvIvmZpkpUU56ZOJWGTIRvr0tJBPEn3GtS8k16/hEJPhw33vfKN8rAe3roVKrAdPa4v1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ENChF4lu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ENChF4lu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A8F6C4AF0E;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775452619;
	bh=7FBGHZTJRYu7L1MZ5c7P0lIeIwAGCDaS6zXq3pgU3Sk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ENChF4luYillEI6DRW83uDLF8UEgOixjlbgTU5eSslKsv9tDgI33di9HUDKJ+cgYD
	 eGF9BhnDhCZOEOn38V/h8NlABZvNif0FdN8rfaMx8FLmwzKdDzLATWqucTyDEt+YTU
	 NfqT0D6XlhR/7pleQPny0kaqLpEyKmAKg3VIHHeekYpv6PWvU5Cn3XZV5e2uKZ1mQq
	 qDbfH/Aj3X88BrZjMYWLRwnxp0oy7Zk3g2Lnk9fbEXlxVJ/rZYB5vmyH17rAXJEXdb
	 Zoqmz8iphTzCy/aLz+Ip/P7SN4/tQJsKgXOgZSTesNINxWwO+3uJzbfykhq12XQ79T
	 +hr/jBFPFeP6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFE6E9D82A;
	Mon,  6 Apr 2026 05:16:59 +0000 (UTC)
From: Alexandre Messier via B4 Relay <devnull+alex.me.ssier.org@kernel.org>
Date: Mon, 06 Apr 2026 01:16:59 -0400
Subject: [PATCH v2 3/4] ARM: dts: qcom: msm8974pro-htc-m8: add Bluetooth
 pins
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-m8-dts-additions-v2-3-c4c4bd50af48@me.ssier.org>
References: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
In-Reply-To: <20260406-m8-dts-additions-v2-0-c4c4bd50af48@me.ssier.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Messier <alex@me.ssier.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775452618; l=1119;
 i=alex@me.ssier.org; s=20240603; h=from:subject:message-id;
 bh=JnQJ8Lwcd16goIqpZG/SlQGLNsVxrLW5+bmwKIyoRFg=;
 b=PuxMN998SjM3n8AkupJDk0MwSmg3U53VD1Wtgv9Y2Xsxpa+Bk0VlFjw+2D2yWCrC3/Yc5zIpW
 V1d7whY1IphBl9Dan+JWkS5spgDZWvipDozucZNEdbDdyy9IVmPZFEQ
X-Developer-Key: i=alex@me.ssier.org; a=ed25519;
 pk=JjRqVfLd2XLHX2QTylKoROw346/1LOyZJX0q6cfnrKw=
X-Endpoint-Received: by B4 Relay for alex@me.ssier.org/20240603 with
 auth_id=168
X-Original-From: Alexandre Messier <alex@me.ssier.org>
Reply-To: alex@me.ssier.org

From: Alexandre Messier <alex@me.ssier.org>

Add the required pin configuration to enable Bluetooth.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexandre Messier <alex@me.ssier.org>
---
 arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
index f24882dbeef3..2edf407db567 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-htc-m8.dts
@@ -354,10 +354,19 @@ cmd-data-pins {
 	};
 
 	wcnss_pin_a: wcnss-pin-active-state {
-		pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
-		function = "wlan";
-		drive-strength = <6>;
-		bias-pull-down;
+		bt-pins {
+			pins = "gpio35", "gpio43", "gpio44";
+			function = "bt";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		wlan-pins {
+			pins = "gpio36", "gpio37", "gpio38", "gpio39", "gpio40";
+			function = "wlan";
+			drive-strength = <6>;
+			bias-pull-down;
+		};
 	};
 };
 

-- 
2.53.0


