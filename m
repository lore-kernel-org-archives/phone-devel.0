Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002E2DE1E1
	for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 12:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162827; cv=none; b=bsXVDMU72mIY93X8W2/htlSaj83oRKBNUrfvsVV7adVNNqGH4keET99+7Z/LQujitw0tiHogQ8B9BcaaGpVctHsJFVFYbCpgJdLM24g0R2qc9RHa1vV52sNh99ziAHu1wlNxmzx/tPNcSReLeQ30LGWhbbnUiM7HWcvlCUSNxB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162827; c=relaxed/simple;
	bh=DwcF0NlBlxdXmxZ4P1HYVbWm6Pa7UHrd11SXdQpckGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EOVXScBgykFX548/MFf88AOCYBVtGzid7RaV/1dngszOM4zdDQfT/a/Nz1TmJRcM0BmFFRzijwa2EHof1Cg+LQJ7QGYO/bZAvZtMiSNyIzvcvRki31EyO7HxnbOFngO0f8iQGyS6TbDKdRmoiiTd02QIwZOPb+F7luupFju1OKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=OL0VXSCc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OL0VXSCc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60794c43101so8956008a12.1
        for <phone-devel@vger.kernel.org>; Tue, 17 Jun 2025 05:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750162822; x=1750767622; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=OL0VXSCc/eUsfqlBUy0rYg1yUN79DIw8lPDh1ZA3L0n/44xmAqcqXzNJXNi+srWz/H
         EPeGpXgc9ErDTlDB7tql/uvTa2SlGMWwyI/FPhK4NWXALlgXCJlH9bXN5fVw5QGNPjZ4
         p1OwbC0jHtpRMrIGILXSmu8aT30qpHPaRchEzOFssPoMqIpyet0ljMwc26TU7q594tcC
         XetWKaE3q4EikCBFPpRBThJaW/Pc+XhKUAC/rPunSI2DbDaHCus1QtvyR/BlCRvDYB05
         QMg9OPAPRdt28uD0iAwhQgbieYIYungae/XLJVlhWDz+quAJX9WIMwIpgJ5xLMRXo4sz
         +Yhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750162822; x=1750767622;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUdlhR7H14Eo2mUGN1/ZO0ngxMr42fTDow94RiXbg9k=;
        b=dt9pp5MBbPkaalg1R7M+zMZX6w7zMFR0m0Lm6715Lfp6lWRtWjFn54DhiyqPhFwtX9
         bBdl9GsX/9B/BBcsnb/xaj2BceGVtorLT4ChQu8YEcc3Yn/cHwjJpO/QiXClA3SKyENF
         iVQQzjnAkFm5DkK4Pk4AAnNOfRbAcsMEB2QnGuypQIy4AZ96tsBSl7Y0olSUZu3CFwG7
         7SWeWbnCo9pUvAzYS1hfUiKmPJNdG3KMvX6nVtbtOu7SUGZ4vS7SJZYgXgUNG1+96Hgz
         zCkb/h+1uBq8WRTEueMOboYlfKiWNVPl7FkpErhDH4ugU09nZq7dloQpbEAF7faDP5Xy
         5YAw==
X-Forwarded-Encrypted: i=1; AJvYcCWsR46DKHbnXWiBiZ51cH0+xebcOlMly6mV1aUhbY6uAvgW5oXarhOYfg7PrMQVtcWdmAtFdcO3eVkrjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIKaEvhxheYZnEEd6y1NIiJK88BbS9t+JGTfyxOdtD950A32m+
	ajjz05pjgy5GqMi+1tkBAXFyLBe63KGYEcvEKf8qEkVs6qfWVJIIURGt3uAFcCJJ1pw=
X-Gm-Gg: ASbGnctXvBv0qurN6bTX7ogrw7hCvo/EUn5bBhXK20GBQG1j92aU0o/2KeuGLok21PK
	BsApx7y+Fp36HYUV3/VUicYByt/1i7ZORt2m/BelzP5BaWc+CVNLjmMfhMmI9CnXRPNt7blKiVY
	J/dw+A1qBouRt04Sqdhoa4Qgh4JQlHqJspRC6SOVKbiKqjE0PPUjmAbhhzBeYneOmRkafS1v1/N
	P71Ms4rddjy3EVKLU3IBX969SM7PKYjZaqB377PKu9gN0uqb2kA/yzECj7aq9nctZIS6MsDHooH
	Fsr2WIrYKsCs2MjW/sS+lIGE0rD+v2mpguEWiXqFHn0ROU+ATURcC/Khpj0aMN7Y7jv3nf8l1p6
	csC9TCEz8C57L1PknfnNrgika1Tfsfi5l
X-Google-Smtp-Source: AGHT+IHXdzCpZsabrbUfZ1/mAGhW1nkU1uiB24DWPjENG/rLfQm1pdzkmZDiD5h6daPKGYzfxXx5lw==
X-Received: by 2002:a05:6402:3506:b0:607:32e8:652 with SMTP id 4fb4d7f45d1cf-608d09998eemr11138714a12.19.1750162822453;
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a8c34asm8053834a12.55.2025.06.17.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:20:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Jun 2025 14:20:12 +0200
Subject: [PATCH] ASoC: qcom: sm8250: Fix possibly undefined reference
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-snd-sm8250-dep-fix-v1-1-879af8906ec4@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAHtdUWgC/x3MSwqAMAxF0a1IxgZs638r4qDYVDOwSgMiiHs3O
 DwX3ntAKDMJjMUDmS4WPpLClAUsm08rIQc12Mo2VWs6lBRQ9l6FgU6MfGPtBhe98yZ2FnR4ZtL
 8n07z+35i7VCTZAAAAA==
X-Change-ID: 20250617-snd-sm8250-dep-fix-4393fa3a1f72
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthew Croughan <matthew.croughan@nix.how>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

With CONFIG_SND_SOC_SM8250=y and CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS=m
selected in kconfig, the build will fail due to trying to link against a
symbol only found in the module.

  aarch64-linux-gnu-ld: sound/soc/qcom/sm8250.o: in function `sm8250_snd_exit':
  sound/soc/qcom/sm8250.c:52:(.text+0x210): undefined reference to `qcom_snd_usb_offload_jack_remove'

Fix this by declaring the dependency that forces CONFIG_SND_SOC_SM8250=m
when CONFIG_SND_SOC_QCOM_OFFLOAD_UTILS is =m.

Reported-by: Matthew Croughan <matthew.croughan@nix.how>
Fixes: 1b8d0d87b934 ("ASoC: qcom: qdsp6: Add headphone jack for offload connection status")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index e86b4a03dd61d2d3ad6a4d9602f69effbaefaa83..3d9ba13ee1e5250c7c4ecce664ff5a62dddf5094 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -186,6 +186,7 @@ config SND_SOC_SM8250
 	tristate "SoC Machine driver for SM8250 boards"
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
+	depends on SND_SOC_QCOM_OFFLOAD_UTILS || !SND_SOC_QCOM_OFFLOAD_UTILS
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_QCOM_SDW

---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250617-snd-sm8250-dep-fix-4393fa3a1f72

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

