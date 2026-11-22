Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374480;
	b=pB+jC8nE8Wnyt167n9GmwKuhOZClkaZIi02+H7xKfk/sBfn9HfCcta/8uK75J2Oo1Lte
	 eLSXbLQx7t0zkE+fQW2AGDpzdc8zBQ7VsQPTZerNSzSbbaxHeDjJqmimhOTge2PxNt+KB
	 3/6BweshCpgnNhMmVLvjmB4gV1aqXeku1v6tfbHoaarvw1Eg2WjxWQca3cM+Uk0pL4TtQ
	 MAhF5S1BADodIUaia1WOpaSBWtO0hhBPBa1NCbbfM68bFNei4WudZlibV4on388zryWYC
	 j5M3TVidpcA02RsoBF1oUViJpITkhGx5E+0H1oFzal1rXy7CJbviooT2xjpU7hzb1bA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374480;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=cGtOuDhlA85emR7IAOl17rWm51QSwTWysOBx8rRrN0cVM/8EGZgkFCdyj0HeJUvfBvt6
	 LDBFRi+lEpqDgnYXd0lyKA0+ZIpzNRkgXsGE4SC1EdE22ZRI2HxDzRRwmr34i3yK+wPpm
	 +dshFuouVOami4yC+CHS9ltTVheu9ucwPPSQkYJsDC4ZOr5dBQQk5Kr897gLE0q+eKmFU
	 6WK2B8xBPPZj+rHkBAPKklqrlkK9j1nENH66sUMg2YSRDSE7S9aIE+UqBocfRTmjblTfa
	 Zufkf2thORZLrqnSL1kRTQSxM9rKAGxOzH6z5TvTkjExRMp9YCSRYmXIsvpAumztrHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JpgIJYo/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AF0606A33E;
	Sun, 22 Nov 2026 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JpgIJYo/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374480;
	b=ForbIaLQz3Kmud54pJsNkEnQ7mNBYiqwMFN+D1gjGdyoN4Vmod0FO20c3CTvvZoyvbUM
	 u+/UkisuLIi6kiWj1rwYVrknN3DpDhqhtzVph/Rw3DDjPyMEBSNotkKSK7WAKhU6Y3rvE
	 S3sgLaHAQ7vcLj1GP9v+pEPY8DYwUfo2wA0CLwQCG/35khE0U2Gi+ttu7TVAYGaeyDEWi
	 TSdI6dRCkFjLbWsuZ+8ALhAqhuQXzGUODGvYSiaDllv9Auupr3TsPzFctEJ8qbwenkDVq
	 kmUWd1SuPo88GHFN552F/gx4fQ4+gczGnoB3QSv6+ZLpYnMoIXyvAKzYyZtSfhM6Mbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374480;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	b=D9vX9Yhl2eOFdaPGcm6nGoaPryjDoxuQtwcZgxMAywduGfVIDImjxUTXwMizDku+rHPF
	 rYheQkPVMgCq6T7E01jxVqO2lL5V+WTawM2Hzz7SksL+giEotSA8RJFJmGlshjFSV2wOJ
	 FtRNDHn3O/Kt+UDSU8Dx4tpaYaXUYwLDEQ+vez4sKRN/sx41dHytEX/adPG3noDBouDVp
	 cEtCxYrS+ofZ+oV/MyzMykkvyiiZdHoGuM0g1TqRDZKrR8Ua0mZEjpL0byuQB+hWqY2d6
	 tHB96hbECJpFITFNSPEapIJA7gFAb49YynUs6DGeNpkebWIXJM1S/1ZRNHVqZqpnclQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0D4E1F000D0;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374480;
	bh=meT3QAiTSr3qSxGWIp+z3THNZElxOl7c3Peai+6jn9U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JpgIJYo/dVMQpi/hC7Uwrr7rqnSAKBbm/6ZZBFq/yO6ovJs3P1EWoxc6rU6Nu/QKy
	 ty+K/iY+NivPLWl87oFQaTRqD+DXK23rICKkY0Y+Cb0Re1XbGwLWvTm3EP4ipx0u4w
	 QmA0HJ3I8Ham5mGlv32aykmopcwaEEOyCVj+4CF0D1vXeLMiPRejHvH3Gv8APH1q2b
	 VACFqyq3QBt3AGzRXb5yQnAfHlgZOyX/TucLS96U/4w/Gu62JlfeJ5W/0+L8pK+s61
	 KQcJlolI8ijwk0KS9q4Duh6Bp4cblFpzbuXXTutC5hsMn/sr/p8S3OOTC7hG1qliGk
	 hLLTh17Qzmzgw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7F2A24C1A9;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:49 +0530
Subject: [PATCH v4 04/11] soc: qcom: ubwc: Add config for Molokai
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
Message-Id: <20261123-molokai-soc-v4-4-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=1024;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=9lI0GDLg+ArIvmjuhBkr6Hwen5svXhSHz+Z0e79/fbg=;
 b=0OPQdu9iAsV5ofxbFyjRGWkLVQrDU3o4uxdeu5jcpSeS0ssCNUt+K/P3CMzaQL5K+cAt4rogB
 VrTxufy+h2pBoG9rAOh0zpdRfPUw8hjSMc0SLIYpw/eht7vSQzZn6yt
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


