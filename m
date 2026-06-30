Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CE42D3ED2;
	Tue, 30 Jun 2026 15:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782834513; cv=none; b=e+9omHt1qOJhluWMYR1cNCz7ZZKh+eGMJqXap7hzhlDcrKw439IWn1Yhq0TM5+MQnJhjGRVLigNjn561m2I1X4UTjZYorX9ZONJMtRhlNAXS4biaj6AYSyFnHO8pKlmlJ4PD+ZkBASHjRj8NJskVHLbnVmd5dIswvJRY695eX8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782834513; c=relaxed/simple;
	bh=/TsKefP+eDXLgJSQOMStC+HgIz1tT7zq7cz3N+m+jMY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sp/HdujlZU1hS/q5WQcY3OvUmwgZ/2x9nMdFA+0QtzwlO4T9pTA0Hjr66NIIn8bqddearu+Z6uor1+jeBw1gWr65VAzWHylscDdeFHh7L25wy+p/SNbZPhD6rkLniSTD3Pv2/I/l5qEGSqTGSxl6HilTo3KqK7rARCkUKQJWqU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ValLKGTj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ValLKGTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB7C1F000E9;
	Tue, 30 Jun 2026 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782834511;
	bh=18V25zJDP3rvrsmnqIMYqk9ft3gRRYL9gp0SKulH7iQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ValLKGTj4vVI9+loJVzypZsZQXcZuVZKge6mjfaDgUBvfRw5RC6KK9Wj3rIYnyfwb
	 eEbXoR7zfRVK8bjf5TV20l1D8k9LBE6RUbi1V7VY6YhdKCOtwmclxZuBc9HhO/Lbyi
	 6hAjv4C3DgY2XyL9ttkl/PcTMzTXiuPNbSeUxVcBNQm5HVCkRnmtVaVePDWAwDyErT
	 8LGrid5GBzRhLo6lMt8KH80lNVdpARdp2O3yhom1I/EPgq6H8lC/unSHy4bAGQPIdf
	 XXHXPuGR2hwbkb4/c/XOAOfAKyHQBEY8pygTale97jV03rSF3HIrbMqVGZpeYV1Hd+
	 hs39kbGqav6Jw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version
 for SC7280
Message-Id: <178281886038.79320.7323449086795202052.b4-ty@b4>
Date: Tue, 30 Jun 2026 12:27:40 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1144; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/TsKefP+eDXLgJSQOMStC+HgIz1tT7zq7cz3N+m+jMY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ+VM1GDz9Hajtlc8Hlr4ix3KzM3HNCGzOPmud
 XKiNFETfTOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakPlTAAKCRAk1otyXVSH
 0H5FB/0R4bio3FF8H+6lVwk/RfpcCvtd6UWR2+hc3WEL2g8I3dSCcAbb3dcASCZ0y34RE108pf4
 zr4G2z6KIdx34JLltwAxOrchQiGKwOQj7RwJkx20Bwz0FPTnQCut9n1ynm6TINN3s0m7UJCcE+l
 fMGOhULzpAzppsHIyvZW8avM7Db2YoW+JQpFNy0NQIW/gpzDZd/obuZGj0w1uceW0kCLCkI1iz6
 RwliXI/x26+DygTcyQHD9szUFzzBxC+diZMjFFoMldu8njQ9ZBSy7PnXJ8A+HOOzgqMoPvxmHxT
 pt8HHYPafRSlLTiYTsM2bJqxi9uTG29+tsWUw9kyeMx2yO8X
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 26 May 2026 17:03:05 +0200, Luca Weiss wrote:
> ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for SC7280
      https://git.kernel.org/broonie/sound/c/0773610eef71

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

