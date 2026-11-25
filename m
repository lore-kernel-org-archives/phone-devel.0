Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630390;
	b=oUDJPyeME5Jfd1n1JvWX9+BgNh4VaTsg8sJD83Xua1PLIY3uzrShw6tMHHnvC+8R2oxc
	 o6uv1ebtxmp8Zrhx3HAPSDlstbgAwZBcrQ4uh+JJMgDypbiFZPacv0yBxzqIhdSBfmzIH
	 1f6W1ECWz+I5WNdyZzediw2x39Tnz83dHE5B+GiOYuz+0h92A4opLotD4UMXlX/6IEZ2e
	 oaCAihi0UU/ETIWOZGIgSMHoqFvXX2bOCaS/iYwLj+TnnCWBSUAVXB8qI7S7aTdgL5vJb
	 e3YwemlWWhez+y7M2Ann0XpJZAZ1Rpl/bNzr0RbMe6NXKj/2yUuuqBNm7+jQTkpWSPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630390;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1tb1rlv5upXEuUm1cKuFA83fMwXrR6g7cRh9cWFDULI=;
	b=sNSeNdmpcQLZGxvGFRqQp1pGENJAy/9OKlnUyMLlFcc28fKzw/juOTD4RTsTGLO4+asi
	 /S6+CbbZwkRPmD4OT7zmnJjr/nbCgTP6gi/FTRRel0AhaXEdQFO6hx9nSMpwqXCy46l6d
	 VWHmCMOs85LndpogwKFPhsPEV7n6fW/+qL0aENcY00vFfhFVlQkwxJY204b4TJjyeKJDw
	 xpzUUwiiera7/WBtWGVUHdc8Hei/xwsZBPpW9DkGnoCFBclvSXrC8PGcCuvosJGzUmWws
	 9GejBI6mpjZoFnyE/kd2TAPHucmPtkRUh2uQZQMS8L2zTz1pqlALXyMxb6WGHTBf7cw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EH+3nzdL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E7760A2617;
	Wed, 25 Nov 2026 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EH+3nzdL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795630389;
	b=NvrACpr4wElO+igVeg2KTFf0CJAsyd5bPAUQAWX0bCYYXSEcqfSNtXM2jkAze2dw/GRA
	 HWB8ovlDircXKa/lOZIabDn7JgsDJdslDIy+4DHhrjYSQSO2+4fPI2HKTugDvUgj+0XBJ
	 yqEkzrXhRv48KCknMgswKh96ZSwoe78XxaIwG5WclTVc3x3YuVNakEXqagY3t8Gwj/Xsn
	 /JiVhpqOjNahwdG3ElCIDyk3f2ZA4epubQI6n4IxBY58ncbNdtKbA/l/o5bFWf705AL+L
	 CPDTvtWx/IgaQV5ZDJsHICJwo5GuoRSGn6YPCrvXYHzDDH1mCDC2D3wFhNVA15hmDIg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795630389;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1tb1rlv5upXEuUm1cKuFA83fMwXrR6g7cRh9cWFDULI=;
	b=ZGET8rt9OvkTZhoPDMVo/VzoNkqFDs/8wVl4z6njAE1dv80atfiUuK4xYwtlUHbAahOw
	 NRJJC61bDx679uFBU6/ptbkdNF6F8ElR6Eb4yMYdfznmpNEC8C07w3kW83LrdJaqSg5he
	 Ey745/whqNij523M+PL5D6DSvM6jSx/DgJ9gkXuXjT+2YGysC/k91JxF8TM/W+53vijvv
	 kAVWKpbbWzWcKDegvcnd2By2njs8Zmoov5SPgU/d+Lb9GF1Oe6A1DaybaR5wVdkTutq2N
	 b4h8zqdCc2lxXbc48em2SwSID9WHuXUfhsXFX3+Y5gepwF63B+31bpyuYiVDZTRJONg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 460181F000ED;
	Wed, 25 Nov 2026 18:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630389;
	bh=1tb1rlv5upXEuUm1cKuFA83fMwXrR6g7cRh9cWFDULI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=EH+3nzdLd/XYtTCRZvKnB9+ZGJjXVut/gb2elwT6kNhOL8nrbu+BmHkUi7xrgUCmc
	 xywIE8lwwepx5tx/d2lqtp2yyEBbriINrXYWDlEn+P/b6OhpYJ0ba3tvunJt6JgX79
	 R9JVoAN9aIIKmHAsWP+nDGuq5mwXufu9414bJZwWYc+twj8boUH8keFuaE1YPr2c3U
	 1t1AyOi4fgvxBZhEZRzRzc8R4TvXJEYpPkxHq1+qBwHQZTdL4TIrpd5gk7EI5sJDnS
	 fqowBaKUWxMDFdEaujnuoPwp5N17RrnAwDGd/iWpRxwjCS9fAO7Jg/YGEEkQP8My/M
	 XvlYe4aRcou1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18CE54CFB4;
	Wed, 25 Nov 2026 18:12:49 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Nov 2026 19:12:50 +0100
Subject: [PATCH v4 6/9] drm/panel: s6e3ha8: Assert reset GPIO in unprepare
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
Message-Id: <20261125-crosshatch-panel-v4-6-120adc58e737@ixit.cz>
References: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
In-Reply-To: <20261125-crosshatch-panel-v4-0-120adc58e737@ixit.cz>
To: Dzmitry Sankouski <dsankouski@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YoR8O/9CziH74UhYPjrFBAlu0YEV4HfID7khfmE7WHM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrByUeXjhNqg1Il1wuxj2H7RwoaQiUOVFCvR4aA
 DkR/LV7ZbuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawclHgAKCRBgAj/E00kg
 cgItD/9zboRb9u6jw6iHWKJzQFwFH0Z6HMNJekQQ154IEmmmvysEAfE7wlnLWnJNj4joZ4OsHS3
 tJKtYm9oa3emHik9vUnnrc/kb9VxTi4kKn8HxMy1EkF0PwDxv0f7eudwzZo0qsgMhjIBUuxMhed
 epTaW9tCKcT5n1Lw0hnZ4DAGpbDBCl/wvRe+36i7TcQBLCZX4P02aKvwLd/mzX5aODwAiwP3RL0
 gviH3Qn0DFUowCB/pYJYPdtNctLW0jie1X46A/QkYKfYd91Ps1Kgnq0QzIhMSlwT965MADf9X7S
 d4Ny5kJMbHqmKQlR8qrnMkgY7d3KgQoqf4/e8RabRmRJyRkGi2+1pTkFsDqKNuuI1+Pe3mzWa0Y
 6TOBAyYFrDsyUA2d4CdRZqxMzwxjL8sEhFSAL//oOQ4HRkX5t9khGc3Kjwl+CfmyI5LhNSg2Y4a
 n8NP5ih5Hrr5fp88jUCVEEXDHzUjtpMD/90PQiTx0zAlra5fv92nfAq+6V+djMix2SV6iaFZSoC
 I3OB7FijYrjCAwWSPHGkbacT7edL0V+pok/AkFj+rkZdVP0DwLcoMeDSHqPEAiaC/RUkpcp5lQH
 uEV1uRGgpxvu/DnvkNQ9WZGc56zFZoiPd9qgWrdC2wfUxqrh2zEMQuSfdCc2c1VcB0f/X9oLtSs
 dsypsNwch5PeMLw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

For correct shutdown, the reset should be asserted.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
index 99290913de69a..2591b8c1a7753 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
@@ -58,16 +58,17 @@ static int s6e3ha8_get_modes(struct drm_panel *panel,
 
 	return drm_connector_helper_get_modes_fixed(connector, priv->desc->mode);
 }
 
 static int s6e3ha8_unprepare(struct drm_panel *panel)
 {
 	struct s6e3ha8 *priv = to_s6e3ha8(panel);
 
+	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	return regulator_bulk_disable(priv->desc->num_supplies, priv->supplies);
 }
 
 static void s6e3ha8_amb577px01_wqhd_reset(struct s6e3ha8 *priv)
 {
 	gpiod_set_value_cansleep(priv->reset_gpio, 0);
 	usleep_range(5000, 6000);
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);

-- 
2.55.0


