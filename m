Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E45E3E9299;
	Mon, 30 Mar 2026 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910587; cv=none; b=rHSeMxxBssNySz9ialJl5SU2zdUTbbXpAzoYw3yYbv7yELAgsluwWS/AB6eEjjJ3HRYOk+CBs6zaiNjUL1BOTrPk4PHsIdA6IZjInj/j1m+3u3MBrk/8DiGouGmtl7bB40ozpn6CrgD67XGR41y2j65xdvGHZaqMz7KGSn9Yfnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910587; c=relaxed/simple;
	bh=+agfRdc+dcYnLqu9IX3zwLjhRBTbDlO5Qktg+C/Xm14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lvQ/C1p7n6w3PW8Yn1Pbh3zZG8/zf8noDZ/8pf6PN5RT9GYamigOAkH6LW4/ShYhjzL+a9K2mBqKm5eQTZxyzNWgUDhB92tmNo33uMGVV1/ZHNie9UbbJPPeqYkbRhQbnPuW1xl2SN3sAQR5OYvWR9h2JAHlZqC9FnyM5OaUumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcJK5kGQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcJK5kGQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E0AC4CEF7;
	Mon, 30 Mar 2026 22:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774910587;
	bh=+agfRdc+dcYnLqu9IX3zwLjhRBTbDlO5Qktg+C/Xm14=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GcJK5kGQR29LL7P8nEG1Q8CxrMZ7u+tIvIdEK0xdd2oM569SqniUIUw3j6Jsa/LQe
	 6uJDnUjeIC7wk++rIiCC5nvYXIhcgiiZ+lqcMVhTws/i9XMpmxDFZKLCl/W0TMO1Wu
	 9qNY4QWgqYUCachdihXQNTgSarImQmGe8SinADQP7olt1TCHmFnejR9IbDzDhPa4sk
	 NHM2Je0kDITKpDu3QNh78AzUlV0m8v4xAEPWsCLtFlPJE/q99KNBWJFo1b87yeNHqu
	 k+RmROmK80Jgz5EQn1Plyc79Ek2FoaAdm8Nszugfgg+KK1LDjZURM0mPeLuTU2q1nM
	 9Sdf0Q8DnARRA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
In-Reply-To: <20260330-regulator-devres-type-v1-1-d2c244576845@fairphone.com>
References: <20260330-regulator-devres-type-v1-1-d2c244576845@fairphone.com>
Subject: Re: [PATCH] regulator: devres: Use enum regulator_get_type in
 internal functions
Message-Id: <177488185494.167050.8921118417105591317.b4-ty@b4>
Date: Mon, 30 Mar 2026 15:44:14 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-3ac6c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+agfRdc+dcYnLqu9IX3zwLjhRBTbDlO5Qktg+C/Xm14=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpyvx51be09ViTVT0wQAtrSGJ0v/zi9de70basN
 svvGMZGC/+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacr8eQAKCRAk1otyXVSH
 0J10B/9f4MB3CICniV1x69BpO/9tO1Xi1DydleIexJHKkJ168NJoeo5JV9UWcpA7/S2AqnRrMES
 empIXRRhlGQz574FaCRVBT/YVqbTfCheYAcfHSpQvxW0ad5qRNcca0X44GGLLVT71eBkhnXjbBz
 WuvfQZ88HOXDjg2OO5oJuGT7YaGCokZcQl5kvG1Hwn3GHr+7uk/4R22CFsJgngjCTeh4XqMkDMe
 bjYKCgaJHh208bba1N6xLDSUdOyUDaZNSwXzc+Y2iNfNlRIu4lxsGFTeDNjTplqb8i03AfgOorI
 xVZqN2x4dvV0M8RzLBcILRQnqgX7cjrJRbMLGNICxwoXjKhx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 30 Mar 2026 16:14:13 +0200, Luca Weiss wrote:
> regulator: devres: Use enum regulator_get_type in internal functions

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/1] regulator: devres: Use enum regulator_get_type in internal functions
      https://git.kernel.org/broonie/regulator/c/5a623ef758d0

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

