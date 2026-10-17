Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1781FE451
	for <phone-devel@vger.kernel.org>; Sat, 17 Oct 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231369; cv=none; b=cSSwXSQVBhCY+My+HPhTgp0Cxa7XzhcnYIRnuYx90DRK6+yjzHucBVsYzem8Al+iX8aMs5atu60KCE7UZtt/5enWEtIZzXAQddSeY/X8PLCHqGDir+m+wMXTog6LXOLO/4e/Eys5AlprSQtJE98SGGaFpXWZCchm3x0WgA9oVYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231369; c=relaxed/simple;
	bh=EBSVCbO8V4DqQ9rlO4rqunERlK9URPSb++T/jRHaW8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMTp7TSG989EqzOx1ITlS6JI3lQJubY6LjSOAaww49u9UJDEjTRgh2p87vpwZCYJXSQHeIf9pplqm9G4pKn4yUDNelQcJssMRsH0dikI7mWilJKETVb5CmqybG7uOBpg62wCTKM2wMSs4rOVnq7Qi6NbArdim33EaUjlQ2GyUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GyiIIEdP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GyiIIEdP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ff680331aso6245865e9.3
        for <phone-devel@vger.kernel.org>; Sat, 17 Oct 2026 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231367; x=1792836167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXVGu8tiuXcZRPdD2PY21S3+U4/Hc9jvW4sjeujnkZg=;
        b=GyiIIEdPueQV/svSuYejsCyWN0Ej4XqmdCrYeAH3N+Q5vrWgBpxxaqS/64ox5XVKKe
         dk5VfDfzUJaCN/l1c81wv1aUFZqD/NjT6BQl85KjnGAnKTG+VKMc65Wt3dcFwpUbDLEU
         S1bXIP1/K9zht/5GTz3wisrOmtjnjmyg5i5T65vRD7uhe1AtMLMfYLMv9TS9J6+2cOu5
         Do0VJ34me95DJyPRIxcJLAKoeZlBfrj7l0b7dsQPs53gvsXbNOXYdpMAEUMw6SJnZ9E0
         9cqMzL3kLORVq3ZvEB50Ep8bNpDpzKwVfsI3/09H8Ghdq+9+xDeN0ca8gqgqMVRBwuwg
         WBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231367; x=1792836167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXVGu8tiuXcZRPdD2PY21S3+U4/Hc9jvW4sjeujnkZg=;
        b=FH46LS8O94yN96tMNTjlaksRGeFy9XdR12XoR5Ay7cetmwfvhowJVmzbksirLnx/fI
         At+zVcaNmVweP8WzS9hjsGgaaTXmqRk2GUWUDh9zc72fW6ADH8idKLXzhMfvZ2wCXOfd
         pDW2zHVaquN+1fFf+tod8cXFI5LVCEm9tPDyVar6FVxwN5sjDFiEB1WpaCH7oh9y4pKh
         1s9B5YHrSNlzKu4GBZER5d27IdiXa7ErpA5H9l8C4C9Qwa41+qOMqz5N9eZfE35X6IlB
         cYBrH5dp/fBkypIHnMZQOm2Uw/Eu3pp0skqDXM+2d5DECh891n4McQyVe6XBrOLb5NfJ
         gHrw==
X-Forwarded-Encrypted: i=1; AKwUvBzYMjDX+kcVw926xZB7/SeQWLMhS7bA27jpu228Rdb5H+AWgg6IaC4egKvoqTk0Kb3Eei0AqZt4+J/Pkw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJDXHLViyMGtQ6BOuGEatsiF5vkH2rE5oS4rRiaj+xp5ryJKGKz
	T7dYw4aK3QXllcYk14qpEwjd3pph38ifcRWrv8ZMOa7Js6GKyWaJU64f
X-Gm-Gg: AYBFou1Fco/+Ilpu10k/FRpqlwszTpR3xIXrGmDgqe/3VOOJLrETRIAabWQLeM56zN0
	oBjAhsslHjG//ycus2877VBo66tvfH6sEZy9rhiSBm0pl3H708nwF6/uMz66xnHDi2VO/D+oz1q
	F8YH2FVLdkc7caWG/JNmNQr7H8fmddVAjNc0SSh7VgDgPeEm8fAgXSIyeo/dcdKW7U7uIwbmpdS
	PyIfVdhRCSsUHSgmIfFXFX9td9o31Xla8UhTR3HjS35HKkFLUa5Knq7zI1KottmMCKam4lqIf68
	G9K2nacLa8b5aonpGKeyJmeh8FtXVjTjNtiD4y+eAGLs4PBK4BY+U2Bhf/ch4Xd9oINe8z8u1Ld
	3AGYIMih3NrYR0n5aHfUuGqAP1FWaXnDnrAaUTBiaJP7bjRz5MfBW+4xccg2I/JDHhVx0OGRGLu
	N6CidKN6EjNOUcC6JjTDwkvsKgshePYcktsttZgTSWBXGyDBbJxAag+hmChLAV+haeHNPT15LJ3
	NwrlD/0cWFXJc/rTfawSojy2w==
X-Received: by 2002:a05:600c:5251:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a1d76315acmr46037375e9.34.1792231366607;
        Sat, 17 Oct 2026 03:02:46 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ccc15aa1sm117773395e9.14.2026.10.17.03.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:02:46 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Val Packett <val@packett.cool>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: aw88261: start the amplifier on unmute at trigger time
Date: Sat, 17 Oct 2026 13:02:16 +0300
Message-ID: <20261017100217.1451-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <bf823f3b-f064-4dd7-acfd-4136efd090de@sirena.org.uk>
References: <20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com> <bf823f3b-f064-4dd7-acfd-4136efd090de@sirena.org.uk>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 06:50:39PM +0100, Mark Brown wrote:
> OTOH some hosts presumably do have the clock running earlier and will
> now get delays added in trigger which isn't ideal.  I'm not sure we have
> good solutions here given that this is all system dependent.

Right, v1 moved the whole start into trigger. v2 [1] splits it at the
PLL lock check, the first step that needs the bit clock: PWDN, the
I2S/PLL setup and the boost settings stay in DAPM, and only the lock
check, AMPPD, the SYSST check, the feedback and the unmute run in the
trigger-time unmute, which the mute undoes. That is the split wsa883x
and wsa884x make with GLOBAL_PA_EN (the vendor aw882xx driver also
starts the amplifier from .mute_stream). It does not depend on the
host: one with the clock running from prepare gets the same few steps
in trigger and nothing more.

Measured here with six amplifiers on two I2C buses: the unmute takes
4.3 to 7.3 ms per amplifier (26 to 38 ms for all six), the mute about
4 to 7.5 ms (estimated, see the v2 notes), and the write that starts
the stream went from 52-57 ms with v1 to 28-36 ms. With two
amplifiers, as on the Fairphone 5, it should be a third of that if the
I2C is as fast.

> > The trigger has to be nonatomic for the I2C accesses, which the
> > Qualcomm DPCM links using this codec are.
>
> Are we *sure* there are no other users out there?

In mainline, linux-next and your for-next the only user is the
Fairphone 5 ("fairphone,fp5-sndcard" in sm8250.c), whose DPCM links
qcom_snd_parse_of() makes nonatomic; the driver has no ACPI IDs. The
out-of-tree users I know of (Fairphone 6, OnePlus Pad 3,
motorola-dubai) are Qualcomm too. But v2 no longer relies on that: it
reads substream->pcm->nonatomic in .startup, and on an atomic PCM it
does the whole start from DAPM as now and nothing in the trigger.

[1] https://lore.kernel.org/r/20261016120000.aw88261-trigger-v2-1-tvlad744@gmail.com

Thanks,
Vladyslav

(I used an AI assistant, Claude, for the analysis and to draft this
mail; the tests ran on my device.)
