Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EE13385AE
	for <phone-devel@vger.kernel.org>; Wed,  7 Jan 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767817698; cv=none; b=eRHiMIBH7UDGXVR7VA3mg8qINSTb1j/oIvSwvVFbX/TwSYjvFpD9DG3MXYPYS49t+cn4iRdA5mtx76OPb85LHfbBoqaANX+qi6Ad7x7JKLIA0eSkq/UQVs8KYfmrFtUFGpSx/ArmNiKl/mZTyp3W8AKjZpXTwfkCruQHp91YWLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767817698; c=relaxed/simple;
	bh=4TFE6/tpJkofw5lAQLj/8ijiTNk01r+hunM9CxLJzak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1bU7s10iNvkQgj3LcLltr89yNuDXUonNgPolO+FwrBBRAiDlNnhG7Ne5dGMSxR/b7Yk/nt3qENltdTwCeR1ljGVF/82kwrz3EGBnPjUY6M0EP79cjQHZ2zflcDbvfpo3vpLUcY+P3a2RxpI5Dakg8jmZaxPSGZER/66j8lesJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qZhkYNRO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qZhkYNRO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B18BC19425;
	Wed,  7 Jan 2026 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767817697;
	bh=4TFE6/tpJkofw5lAQLj/8ijiTNk01r+hunM9CxLJzak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qZhkYNRObkGaWzy09j3IzNNjMmtMS/m/rk4Y5PHc9j/fiLfH53eOFMif7EL3D4DCX
	 HGxz1muWvwEGbB7uVZRCZh2UV17zO4E+YgYFfmBngU60+cRcExIgwidCKaNHWJFwxt
	 048Gs344SKIOsK4n1+f30fPlPcAB6XUxqlHuU7204N8k0esP+CRIKPWctIqeVrITjT
	 rMw8IzmrpSKNPg8mU2ua02nzbC5zLkTOCAo0DBR/AlsRMzxr8UTdXY0bA6vAtdZEsz
	 0NUYfMlqhUtco94uohXW19e9Y4iYjY+O7MTNewkZTBhASAiQgoHhYoKw4s5RowmiXX
	 fFwDuVYIqF5uQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74305D0D171;
	Wed,  7 Jan 2026 20:28:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 07 Jan 2026 21:28:15 +0100
Subject: [PATCH v3 1/2] doc: board: qualcomm: document Pixel 3 / 3 XL
 support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-pixel-config-v3-1-02a25e3fdcfa@ixit.cz>
References: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz>
In-Reply-To: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Glass <sjg@chromium.org>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=tR/yDcGYe9KsmThFZVe68c8YKtFLwect8VpgVOCqg3g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpXsHgrGbQl1CKKnlCPl9/w8vSdapSI0bgUT92Y
 YkGVkR/pT+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaV7B4AAKCRBgAj/E00kg
 csDCEACdzHGycxGA/+CFDj/RO2QxjSgtZWDoz1U0Pdq2WCwLzeuGMZDr3/g/Lv3p+V90sgbnqk+
 2TUZPGIhJcjXyfrCyqp4JQ4PbBDZTGOr38qwYbs/dfKN32JTGe5rX5+5EaJOMQJ5TU8VP+HwBki
 r2G8hEe9n6lEe2inIMkI8/igivB91P6KyZG/9IPHv6IoGE34caaMBG7a/fJJw01CmMyPcpp/2jV
 a3Yigoveorjz0VIJFYim/mE4tysM2OPrMntqOkDuf3WQfOyGkiXy24padsO/qocUIy2FZOJen4v
 xPoJcY2rNXXTM8BA1t5rYj4H3ldtDYFTm5qp99H/cR+fL5hkUJ1B9F2xN08cyN50eXhMW04VCjN
 bd/6W+jjOrmqVpoVSuQIgSXP9qybfPGwdxlG8hB68cba2KPL140ZPHrjlb+9U0qjbQrYB7vNJpW
 d1GasNklvSVQ0cla6CmOHDmV7PKjm3Mu/ByowxshTt4kLxMEcqeANIP0kY+BGlcJBHlQR398Xa8
 jt25OteAUYiEc0zel9/9gYj+3ygVO20+MlD2xqT3lG2bDCpm2XCRAtKISA9iLH9+02du+HHRSt9
 zlyquMVwoqgnT4S+SaGadHIHSWClgUEcS0HFeHFU8BnRRQd+Gl2tEiM2lSLAaUs9mo69ULn8TPq
 rSrUaJUTDhTKtXg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

U-Boot does work on Qualcomm 845-based Pixel 3 and 3 XL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 doc/board/qualcomm/board.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/doc/board/qualcomm/board.rst b/doc/board/qualcomm/board.rst
index 642c5095261..e5dbc9816b9 100644
--- a/doc/board/qualcomm/board.rst
+++ b/doc/board/qualcomm/board.rst
@@ -38,6 +38,25 @@ with appended dtb, so let's mimic linux to satisfy stock bootloader.
 Boards
 ------
 
+Pixel 3 (blueline) and Pixel 3 XL (crosshatch)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+blueline refers to the Google Pixel 3, and crosshatch to the Pixel 3 XL, both
+powered by the Qualcomm SDM845 SoC.
+
+These devices use the common qcom_defconfig with the google-pixel.config
+fragment for configuration.
+
+Use the following commands::
+
+	make CROSS_COMPILE=aarch64-linux-gnu- O=.output qcom_defconfig google-pixel.config qcom-phone.config
+
+The DTB is called:
+
+ - "sdm845-google-blueline.dtb" (Pixel 3)
+ - "sdm845-google-crosshatch.dtb" (Pixel 3 XL)
+
+More information can be found on the `Google Pixel 3 page`_.
+
 starqlte
 ^^^^^^^^
 
@@ -131,5 +150,6 @@ Other devices with boot image version 2 can be built like this example::
 	fastboot flash boot boot.img
 	fastboot erase dtbo
 
+.. _Google Pixel 3 page: https://en.wikipedia.org/wiki/Pixel_3
 .. _Samsung S9 page: https://en.wikipedia.org/wiki/Samsung_Galaxy_S9
 .. _DragonBoard 845c page: https://www.96boards.org/product/rb3-platform/

-- 
2.51.0


