Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D372F5313
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 22:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767910383; cv=none; b=BZEAf/n+fEqvcbTLQwx61n0GjJo1oiwsqFeb+g1KWJP9FETXiwPSxIHFOSLYgK2Lj4X06ChK9GAawYyFBIq/aCUzl42333rq4rS/umTyThJWN06zOS3HOEA8CDdYJ9G51b8ntXDtfHeUkgXqzmRDHQuMZsdTMiuJBwWg1KFihm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767910383; c=relaxed/simple;
	bh=FCVSJT3Uuehp3IFiF6oce1OA+4DXnQYWiI2P3hdWVro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WuuPPu/o5bi9UpTCM5zferyCihXPowwZ+/l+gDBxEbZHdmh3AzinJ1SXppy/zr9q0MkpPxqHWldL01Xl3v1V/Xutb8bqihYzhhGnWqXNe+AUm5FehUBSc0rntG7BmizSw9xeZZVqrbnMEzYsqMsxnAnKdnZZjMEugyEWgk8cNMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYsIWxFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYsIWxFT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCDC2C19422;
	Thu,  8 Jan 2026 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767910382;
	bh=FCVSJT3Uuehp3IFiF6oce1OA+4DXnQYWiI2P3hdWVro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tYsIWxFT7IooTxDN3K8YZ4De+Ay4wRQoyCRkDdUD8jAFWwV2RLba41j2nUGN4LKTO
	 nPimjhggXK5qoo4jlN0GX23dIVHQDqgSjnQUZCuk33SCssqUrn9zYYL6amiIY0N/V7
	 SrBAy6J4cYhkvC/Ga+kftcUZ4AKNbMiCc6vyyJTDPo57m/BKlil6PUzj/Zq2ZW/cTK
	 anoDYQKmBHfeDw4bzEINKtXM+srBwGu7dCFcheyLmQu11tPhEl8VypEbnErOukO2sP
	 74aJwHodFvRj+mszIOLJ9taiMnFLhUJK8YY8PbMz/sZciZoURxIdT9Iq4p47qDRdXr
	 6fRkdyiMF5AfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D507AD232C1;
	Thu,  8 Jan 2026 22:13:02 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 08 Jan 2026 23:13:02 +0100
Subject: [PATCH v4 2/2] configs: Add google-pixel fragment config for Pixel
 3, 3 XL, 5
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-pixel-config-v4-2-76a2212b69a5@ixit.cz>
References: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
In-Reply-To: <20260108-pixel-config-v4-0-76a2212b69a5@ixit.cz>
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de, Petr Vorel <petr.vorel@gmail.com>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 Luca Weiss <luca.weiss@fairphone.com>, Simon Glass <sjg@chromium.org>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Simon Glass <simon.glass@canonical.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qCGWssl7AevuFwYko+wSdsMSFJKTaUJcKdPCvF9nMuA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpYCvtkv22Eohm2V3JBTpdP/7UB3Xxji5Zi0nqz
 iLmElFyZsSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaWAr7QAKCRBgAj/E00kg
 ciOGD/9HqvrEANPQGbo27mqQqdson7R77BTJp2kLN6vO9Bfyu+OgJYgd+UHQ/fJG9XBhnp6/ciE
 KHGW1lUqFeg2OJrlk/lU3yH040t6tHMfWoPX2QBtO7xKq7qOCnYQaJpxiaM5OeYvw32oXTQWM7I
 9Arc9jmivRCUt+B+IqwdtB7v1009o76voXozElYucjhz+rM0zHQ4EJ4wR+oyZG/BDpVWIIOl881
 ofdnYvEEap9u2u3UJwbWIxNdVYNsN4JB5nINW0vI9QgXBd4dsf2J+X6wAzLGyjJIYd/WKpsoI8z
 K5vp6MnP36nDCe3rF3XgtBvB8mq4KK4PymjdOmuhuJ0JW+S8b21lvQJoN2nJLMHYQIIZF2jdbvP
 N12K42cr+BqoiVkxNc3OmXKzx+kZwd17MnabYSYIzUGYWQ3uYSREgLg3cUA6a/mnwd6l5FznC1q
 AKA0FSdAQCVMcxPHV8E/WvZzFsNjXiyNuF/uoToGq5jScLfWJCZiDrD6smitPybMTkuHSvvpt1l
 gY1/T9MhJAORu0DeDyKF/GW4afL0WiyUKRD7hkKBlwdTCcLub28Ghdb/6dNwOizoxa6xFWxK/QG
 hSCiDfDjEDkZMM5j+XwJ6vVuE/NR+MbovwJejWKF0evty8+jzDea1b2qSSSzkB+nSB3SbsdRj+d
 66Vowtd1R9g33Mw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Introduce a fragment config for the Pixel 3, Pixel 3 XL, Pixel 5.

On these devices, U-Boot is chainloaded via fastboot. However, due to
additional requirements added by Google, the image header must have
a specific value for the text offset.
This is solved by setting CONFIG_TEXT_BASE to 0x80080000 in U-Boot.

Reviewed-by: Simon Glass <simon.glass@canonical.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 board/qualcomm/google-pixel.config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/board/qualcomm/google-pixel.config b/board/qualcomm/google-pixel.config
new file mode 100644
index 00000000000..999d4e45268
--- /dev/null
+++ b/board/qualcomm/google-pixel.config
@@ -0,0 +1,5 @@
+# Enables chainloading of U-Boot on Google Pixel phones using
+# newer bootloaders (Android Q/R)
+# Use for following devices: Pixel 3 (blueline), Pixel 3 XL (crosshatch),
+# Pixel 5 (redfin)...
+CONFIG_TEXT_BASE=0x80080000

-- 
2.51.0


