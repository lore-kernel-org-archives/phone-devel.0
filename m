Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B15536CDEF;
	Wed, 14 Jan 2026 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426611; cv=none; b=czGV4Qh3s5WTt360KlO+oQMfJD5nkF5gOb4qcv8orV1GUlT1gXIhfq0qLGb5JsRYwhHzlllJ8ZRMO8QAq8Ox9NrF6XKGkza61FohfZm6s/5xX0rjADT6MXoU+eoQ948fhtzgUYQI+y1068uXINYWjZvJDDLhVxcM9Oi58xesAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426611; c=relaxed/simple;
	bh=Z1dfX9gk2urpYUYEB93Z15lfNXAJVW6pafH+FHMy1bs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dOEHYXOMJkNzXNtamh0FzzMgS/kK70Afe0W083+UIH2KB6c6hnO8B24O3F3OiTSPb5qmzLqxzjUmDxPC/u4NmXw13B1e71P1fWR9VG5WR8bOf1Rhi5tmImKV2h5UdFNBAl92BDmhBNHsCHcnAei2v8jHZIGK7HMWgatzBq/2ajQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBaltaVT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBaltaVT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B2DC19423;
	Wed, 14 Jan 2026 21:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768426610;
	bh=Z1dfX9gk2urpYUYEB93Z15lfNXAJVW6pafH+FHMy1bs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBaltaVTiuHqpMyci1U7wQUj8laOiH2rCgx9CIg7lY1K9Vt01dwi8Fb7lR01U7i74
	 23kb9D7MFXlFMD0UK1u2oCSe1NEGrUyS+UqUIfUi/qFl33V2RTnARG7DDtwCt13+YA
	 ExeSVGwDq+ojoxxNaeb7SOCj7TTsDGmHuvA32Y88t1bAxSGRtiWPCd4E+LKPC9xU5u
	 +dZfDWK/uP8lpE5IRCCLWf2uMy1fsiG3jRk8HdZEscuWLKw4MR1bDNQYwhTOuqMfys
	 HyGgRnLY707aMx0lZON/xzq7vtqgDKeWkGwD/hY+D6YGD7E0jgTGMZUXt9syYVqLWA
	 3RawZawSjUSNQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
References: <20260114-aw88261-dvdd-v2-0-ef485b82a7a7@machinesoul.in>
Subject: Re: [PATCH v2 0/2] ASoC: codecs: aw88261: add dvdd-supply property
Message-Id: <176842660767.229619.9557284936368561049.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 21:36:47 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 14 Jan 2026 16:03:23 +0530, Bharadwaj Raju wrote:
> The AW88261 has a DVDD chip which needs to be powered on for it to
> function correctly. The property for this was missing, so this patchset
> adds the dvdd-supply property which enables a regulator to be bound
> to it in a device tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: document dvdd-supply property for awinic,aw88261
      commit: 18d524de812ff37e7de12a2acddfe7eee6b4ca3c
[2/2] ASoC: codecs: aw88261: use dvdd-supply regulator
      commit: 519d0a6b2ca5a891340b6c24a4c40545f518e1a8

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

