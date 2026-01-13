Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B413904F0;
	Tue, 13 Jan 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312198; cv=none; b=iyUl0TzJQy468T4ZRMwGILKTt7Vsr9cctUpZD9/aecKwSTM4aM35KM5/JQYtIMogaYDIAiTQkQ/3ibryOBvZ/EOxazFJeBvst7q22LEsYc+PxDdpWrXj7IwO+l+BtIPEXVZerfvMVnzTkzHi9zdl7Ro7Z+FRjCFmWVwMGr/ARp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312198; c=relaxed/simple;
	bh=GDFDkGbCJ5TgA92X+tpXDckP8PixVMFa8wvkXOOtY5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y2LW/lNbx9epU3XVtQ9zKBJ5lCW6Nm/S+WxtTk/pndxnFgecRHUnx07JnDQZArJIuSlV1gi+rNCdc5CbTmXEHRX23BIUaInxeUO72D1UN0pYX3VAAmaNKBYZfAs9m0jy41KH+pn8GlkSxL3e9yG/nDgmefU8GxKPUNo+8PI6ne8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXrVJG2m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXrVJG2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27355C19422;
	Tue, 13 Jan 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768312198;
	bh=GDFDkGbCJ5TgA92X+tpXDckP8PixVMFa8wvkXOOtY5g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bXrVJG2mrwi9h7q/S1LeQlVSuWNEQwu8+nlKb1V4Gs7zfamZJRBurUzS5a5i/fD9G
	 yx50NtinLHXySdusnJ+g19MtUjSJ7I1ahyCTXF90XGpfD3+QAckGr6Jl2/Wupk96Ns
	 CbdXTmbBCLLNeddEomD4nEV+KmrVcNd+oM5gMb5ZrVQBhYR9w/lp1D9ByRiy1yHgvu
	 /eoA63tVIR2UTDVU2XFxtiuSEfOVhIuBivP2kiB9tej+qPxridj3vF4WliNrzWJXpK
	 HViltXJyRnTS/86hDQaGiPQYim5wndBJEpgcqkvuiQIMkL+jMJAdfdVHyfxsES/uZF
	 8XDCOYTwfCLVg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
References: <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
Subject: Re: [PATCH 0/2] Add devicetree support for aw88261 amplifier
 driver & minor cleanup
Message-Id: <176831219589.70484.13135502001126330506.b4-ty@kernel.org>
Date: Tue, 13 Jan 2026 13:49:55 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Fri, 09 Jan 2026 16:02:04 +0100, Luca Weiss wrote:
> A series with a small cleanup and then a patch adding devicetree support
> for the aw88261 driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: aw88261: Remove AW88261_I2C_NAME macro
      commit: e76f8c269e3558d02e19515cd3cc470e42ddbd36
[2/2] ASoC: codecs: aw88261: Add devicetree support
      commit: b9198ce5c6dfee19b9662dda95ba559af9cdf53f

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

