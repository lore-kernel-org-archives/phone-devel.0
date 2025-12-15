Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE5C3093BA;
	Mon, 15 Dec 2025 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765810475; cv=none; b=cPjw9SQQ10icFB3Rmb9su75QKSm1YoI9JqTYrBO7HmC/CIU26Qc/oKERW7zzGr8LSiboUHOYnLYUHGc3ugxfZQxxYeN4dg95Y+iFKPNdAqh8/umZNRWwgGCNySEkqGJDFL6PFIeYATGXYcvdV268vxs1HFztgAfQLZnN5CWAlXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765810475; c=relaxed/simple;
	bh=McPL/V5+VICDbNj/YnyhPIUOoM9MCkCe19K4JXTXOek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tlz0MNvKEvv2kJpShqhM7i58LcMpb3PWcgWtEuG5UIyVxadxV62uGZHPkUPRXOQKxJJgxkNUmm1U8TommfqQWDIDxHFGnU311cY1HzMwJtpMwuHmLpJNfTO7hUoqzcEgsBN9ThGtUbcrCclB/nhToOUu/9cYT9jY17S0odZ+dv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=ZDaB1Cmb; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=pjsMWxte; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="ZDaB1Cmb";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="pjsMWxte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1765809434; bh=McPL/V5+VICDbNj/YnyhPIUOoM9MCkCe19K4JXTXOek=;
	h=From:Date:Subject:To:Cc:From;
	b=ZDaB1CmbIkjyUizkmRO6FAEGapvWSAaIaQ2MnGIKYehKdctcb3/8ldTYPCvv9gggD
	 NcWWD8MUzSBa5W8NuBLB8urOK72XJDiFponlC9cfL5BL33fDyV6hq9AsXbNDHACYu9
	 1t+wlSUn3fIhdquy+dX6ebz4tEWI763IRcl2oj/D1Tu4nAAmZY1Cim6HjJxAP0j7vY
	 Qhp1EwW17fqsJ5ObYYaersSBA89XWwX4jnRpCzMce1S5g5uQ7c8UBOcIi3dSE1r52U
	 FEPQfllDaVCU0bI3RMrnB8YlyV+lrVknYVO9LFWE5fjs/2bPX3m4tbJDaQxBVo+CSH
	 uopoHCZiPHgTg==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 7A96EFB03;
	Mon, 15 Dec 2025 15:37:14 +0100 (CET)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xwxdq6gGIeX3; Mon, 15 Dec 2025 15:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1765809433; bh=McPL/V5+VICDbNj/YnyhPIUOoM9MCkCe19K4JXTXOek=;
	h=From:Date:Subject:To:Cc:From;
	b=pjsMWxte30XUdZNgAsLfxt3DKOsvzqhdyxl8mnONyJYepB/yJ8zWXYonak0Jgah8k
	 iL2D437CUFAozAzTiCAnES9YNp+kaQQjrCldAuyyPc+yUyrPjxH29POZqf06h6HKh3
	 vOXXbGfYgt/4lT8+cmRbg3OYNWMrZuVHiHZLSjHlSvZK41p+sApYE+RlFw7Copf9IE
	 Pxu9ePFLHWqaSrzJPEkWUW3d+RLyUSmI4LwE1hZw61NDZ0agnY/zTQPhjoFgZm+fvb
	 pzIU/JvlLpad6GQArnI15nkf0ZhMYaSD6bhjfh6jt7DWNlcbdP4igJqjyNhNgC7qJN
	 kwNXvlnYylE2g==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 15 Dec 2025 15:37:02 +0100
Subject: [PATCH v3] drm/panel: visionox-rm69299: Depend on
 BACKLIGHT_CLASS_DEVICE
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251215-visionox-rm69299-bl-v3-1-69c0521465c3@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAA4dQGkC/33NwQ6CMAyA4VchOzuzFemcJ9/DeBiswBJ1ZNMFQ
 3h3B140MR7/pv06sUjBUWSHYmKBkovO33KUm4I1vbl1xJ3NzUBAJYVE/l7xIw9X1KA1ry9cERq
 gUiCgZflyCNS6cVVP59y9i3cfnuuTJJfpfy9JLrkt671UhioDeIyuG5vhsfWhY4uY4FNRvxXIi
 ratEYgCVbX7VuZ5fgEXk9a+/gAAAA==
X-Change-ID: 20251016-visionox-rm69299-bl-7e6a2e30626d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Gustavo Padovan <gus@collabora.com>, "kernelci.org bot" <bot@kernelci.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1612; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=McPL/V5+VICDbNj/YnyhPIUOoM9MCkCe19K4JXTXOek=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQnBRQjBTRUxJQ0ZqY3k0dzdKWVVVZVRFeU4vTnc2Cm5JS09uNkRKTC8vMjZRMldZ
 U2FKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYVVBZEVnQUt
 DUkFsdjRaU1N2ekI0N1NYRC85VDU4L3VIQWluRnVDc1RkUytwNHljRmc0ZG8yaTg5S0hUcE9kbw
 pmYnZMTEFtRFRVL3Q2T3d4ZkpmWHlnR0VFYVkyZ1ZvbUNEeThrQ2M4azZxb1lZSkx3SW81Mmk5N
 UFOVEZPVmlnCmsxT2QwOWI2amt3TzQrRTROV0QwTDhKSWQrUTdJNmlRWFlWYkdKTWs5NjBNZmFv
 VmNNekREcjRpZmZaY0gyYVYKVE1pVEFXaGNoVll0OU5lUzdQU0dPRndjcmNOUW5xV2FWU2lWeEt
 sSFZyNkFpRlEydW0rNTBUUUV0MDZ2UzFKWApzRUpnYmxqYXp3VmZzK1lPV210RzV4TVFDR283N0
 VXSGprUFdVOGJZbW5kWW5SS29lOWNGWnl4dXB0bnpnYnBMCitBbE9rL1VlTDV4dDc4bGdwQzVMc
 jZ0eXQ0cS9iZ0JISXp4MWsvTUJuVjdmWW9WZVZ0NXFUZEZPYzVraXhmWjIKdGF4SWJ6b0VGNGE4
 UDArRlErVGZLS0ZQUkR0OG5jSm9MeDdtczBDbkZpVGVraUFKbEVNNk9kTndoTlVyOGpCOApCM1R
 tZ2pOVGdhcC9qRFFjbFV3YzFnRVlxaGM4ck43YVpELzZ0NXNIWmJUMGJGM3JHdmxSWDVwTWFRck
 V1UnFNCmQyK2k2NFRmcUV5MkRXVmkwNk83Q1RxWCt4YkZGdjNsWDBNSTM5NS9FTWhqWDF1aTg3d
 VhaNDhVOVlrb1kvMU4KU3dIRlVteGRscGZpVmJVVjFiQXhoNUJONkJ4S2pZUDA0NEpnMzRLaVdJ
 SDQydVdjU0hYaVJGWW1ZWDBjb3hnSgpOMEg5SXRGUnFzZkxpWmlENzQ3RW1qbkZWdzVNdHJkYnI
 vbmgyWEJMbHgrcjNLcDdpa1RmZy9DR2VxL3c3UHE2CjlZcmY2dz09Cj02T05HCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

We handle backlight so need that dependency.

Fixes: 49802972d116 ("drm/panel: visionox-rm69299: Add backlight support")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://lore.kernel.org/oe-kbuild-all/202512020154.xVlxrCXE-lkp@intel.com/
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Changes in v3:
- Basically a desending of v2 as it still bites people
- Add Closes: with a link to the original report
- Collect Reviewed-by from lists
- Link to v2: https://lore.kernel.org/r/20251017-visionox-rm69299-bl-v2-1-9dfa06606754@sigxcpu.org

Changes in v2:
- Add Reported-by: kernelci.org bot <bot@kernelci.org>
- Link to v1: https://lore.kernel.org/r/20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b..59f5a31f3381 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1112,6 +1112,7 @@ config DRM_PANEL_VISIONOX_RM69299
 	tristate "Visionox RM69299"
 	depends on OF
 	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for Visionox
 	  RM69299  DSI Video Mode panel.

---
base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
change-id: 20251016-visionox-rm69299-bl-7e6a2e30626d

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>

