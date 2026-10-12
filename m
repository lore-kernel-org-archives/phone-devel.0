Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FFD4CB8A8
	for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828677; cv=none; b=nDXHpAryVoZK/kSynmHgpQSVLgTqrQdtR8hAgbKNBuGNGFEVbfxLfU0DlD/ASP5tqv/sn9lrwdD/vReaqi+1enZO5fktnpqgHaT5UYqdCqMtKa5sS7h3BIRLLysOeiCTRf8BDWNAdek4vojE9DhG5k3aOmuBfvC9l8gEWZzx07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828677; c=relaxed/simple;
	bh=2LAXvFWjSHWpY8mhkHXQzcq9Ba7ggDc8u4QUBCqYd6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWFUAxX/MAoZ5VQxMt4zWOeOy1ATX4LYboTzwLeytZQkJoX//avZe4HCjscPLLJZaL6VJvt7+ypR9O80JBOjrx61TDXlRp1Ewa29lVyTt38q817p5e41SPLB9Xke5yq5E0IGGXN7TvlyWTCubnvP0eWda9Z7HnrYhY44AKIXvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=APTor5fj; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="APTor5fj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2851653a12.2
        for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828673; x=1792433473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=APTor5fjY85R5pPId1ei9EZBx9dI69hfSWNT8Plq+QjIMaQLvo0dlvbV58IBOw8A/+
         WGPzHQYBn1ouBnuzgcRLvzf9633tokVpvZDwSKlsJ0p+qpW2C9E6M0IVplKpTsTfNM2u
         WEhwHz3D++F6HLTL0S2lYdwBjuoy8HIxk0nX6P3tZ9pr+6gMYG6EmUbKpD2TgqqmGnBa
         n6okTapoZFaU1833oNV1mjrfqIuvyt3eCdOAqAH3ORjJyQX6Qr1+2dM7/DGuuzr/iZwC
         q54MwXzKEF7JjwMH7F8OfNzaG3S4o9uonMtKME1N0kZXzgaf4xv0n51kPFXMx/8foQbh
         P1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828673; x=1792433473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxZgZ36Wo50LsnIKnkOJrinMNq3Hzc2rg+tfq9dowts=;
        b=mNHg2xteEnQ/vqnzAVxaG0H9FG+huGFlaEVVWDhVTfiGkDqdmYmyySBA6M47rz6eba
         4OG4qJ3WNOCpZ1dPdpg1vM/vnXVbEUbm64HUzAZv01Itakv27LOGnZZDi2omVdsB/M5D
         LBwoDOKogyF9lNd8Fh5dXzXWWfxhizgWfaJv7T961Xrpg4jrrIQVa92xSdQv4YZ2+wiW
         V5mLFNSWX1iJhnjUPzr9TCnKGjYz84gLgFr7fXkJ74+Bc180cTnQw4aMraDMs4KuBGMM
         IZQ2oC4AHbD8nVX6RPf6JWR/rezeKbuvg5ktsD47UC4DDwyrikusq+QAdLsE54d+2AlQ
         fceg==
X-Forwarded-Encrypted: i=1; AKwUvBw3qqDTeNvzHruWVb7pOJa9gaL4N5PKv7V12XG8oyhQygzICzU2da7buNKLuOwPHX7m8evHyBAdlfWGyQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKy/oNHIrQ95NNYm5yGeJ9M9ip24EUsgc1TviVwvpGg8CMTLeTx
	B79QTkJIXuJ08YTLCUA7E8af3QEzQK1Vf90EVxKrh89t+U4Hv9YZCDVRR3mzPA5OGCY=
X-Gm-Gg: AYBFou3i+g0PEM740AvG3Hk1S0l0wkqp04Sw4Iw/+XiXyhdzzk6HvY6F2kk0yPQixJv
	H7SqlzQnKaOcKUcddf1FthYN3FGYzEpCQgr3Hy62UyHKjlGH9W1QodT7dqzwFSXMiXnoXs/Qxov
	uTtAJEEI5trSswt3KoPyhZJuinTQc9TXMRaKoT1bhQkjPpPzmNUu7WsVKanFhntn3XVq2AOFg6K
	3AiCv6Vod1dgIWK67+vJbFolBmcmwWA2fcP0m+l8FPR/JgYHtTHVdAPe3sn780OdNOM29zZUKXH
	sf0stIfaJtlqLfU+qSGFRmAey4iipMe3SdlvDm+TEQr55fjvicnBdyYzm2Gnfl5bkpNVJB8xZQZ
	6jgE+46ZYbCv5Bm+8fJn4wy/2r8wmxD8422BKKnNrRjh5XgaN0fTtW6nbkXskeDjeMCrZfoDptu
	dx4rDARSvYP88RIMCNtRqdCCRwdJgKMumyAGtfUL/k/nrSkEP++t99PA+FJPYx9wsrLD0qqwcPL
	42F6n6lDtPD1EFHdr5EANiVLlmg2r2LMabnl0ZfrZUNMlV3LdZpd98C154VYKPdHOhjYpZwVOC6
	kVFqaLHNk6fWWIldN68=
X-Received: by 2002:a17:907:1997:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c31aa056fedmr1008415266b.27.1791828673444;
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:03 +0200
Subject: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Jasper Korten <jja2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1566;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=sMlOHXWIQUaAlGkuR7ZEpwEAbe+Afp5+xO5cvE91lII=;
 b=5ESqndbcoHCWmYQ1IFMtTt9lOImdBH4J2Ge/7LsrgcAiob3q5Ug0lELJHEh6SUsH8K5XyfvN3
 QeGNqjyQhkcBP7aV6EPAieM/u/rshdDDc0LzpFqGrvF47BlU1FtdRDB
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Jasper Korten <jja2000@gmail.com>

Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
Galaxy Book2 Go.

$ edid-decode /sys/class/drm/card0-eDP-1/edid

00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed

Signed-off-by: Jasper Korten <jja2000@gmail.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 2b455369ed70..73cdc2d37ab7 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140HAN06.4"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x67a8, &delay_200_500_e200, "B140XTK02.4"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),

-- 
2.56.0

