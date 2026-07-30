Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C334766A8;
	Thu, 30 Jul 2026 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453675; cv=none; b=oBP4PXg2hB7BB2d0VMp1/Yffj7gTfYZ+8P3fIlnqnGlG4rLms4TlqWC6IBAvntMLtKGrJndvaVpXWqD1TYwT1U2jEEsypKv6HaC2NP8yc86BYWWIA6jx3BYojlSOSeE7NMqt1Fq2d2BJQ6Zhe3uqXXMwrdFB1li2QNcUK2MxwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453675; c=relaxed/simple;
	bh=+1rqH1Xv3L+UJpGKTqUdXAqDXeaYiKOiCXC1oq9vh9E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uYNL1lWz8mOqHpz4E+99Txp2hGLLvOFHYuRFMnNAQDEyLH+slV7z0dPKCrSRZ0O3QOgeNu5tDU2tONpuBZllJ6HCHcTJZZW18Js9B9chC+r5z8qCjmq/oerLAMVmdp0kOALxBRIAiMh2nAAv00EPQO8y3ylQI5IAxVhZO+d1i7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBHuIEO/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBHuIEO/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1B41F000E9;
	Thu, 30 Jul 2026 23:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785453674;
	bh=t8736sQ/5IBis9D7UvxELF/F7VkyHKnQLDDSBLgZ+Rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VBHuIEO/K+boYdHTg8FC423YEblZnSvt1pZciW7kOPgLmrmTvVIh2Ud08LD6iviOw
	 WHerC6nj+diT3Z80WOBa8A6Exj4FqRTNvJ0+a/BkQJ8M15JUIP3wjdKifY7hB//+Hv
	 zraaTewaVzdwDpyMk3uKIxBCXD6TgzdR5iGeugVtWXnsgIXbvIgfWWK7KDJ9rWNgyv
	 4Fi48jRRYWCkNqa5TiG8esHPj1GTlV3oIFahLiWLcwsns/j4iQv8U3KHoA/4kh/yS4
	 kMF0qMxecdeEdE+WrxNu+EfOVKyfxHn4nSph2s0XamyNhdPPuvBeZUCyApZMAD2w+0
	 St0nunfc2fi7g==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org
In-Reply-To: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
Subject: Re: [PATCH 0/2] SM8475 sndcard support
Message-Id: <178543794204.343356.16900109815930791764.b4-ty@b4>
Date: Thu, 30 Jul 2026 19:59:02 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev

On Wed, 29 Jul 2026 15:31:53 -0400, Esteban Urrutia wrote:
> SM8475 sndcard support
> 
> Add the required bindings and driver support for supporting the sound
> card found in the SM8475 SoC.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add compatible string for SM8475
      https://git.kernel.org/broonie/sound/c/a95cfed54bf9
[2/2] ASoC: qcom: sc8280xp: Add support for SM8475
      https://git.kernel.org/broonie/sound/c/1ad05292c01b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

