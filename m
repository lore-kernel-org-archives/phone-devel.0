Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47393DA5B7;
	Wed, 18 Mar 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841858; cv=none; b=TNByrYk+1htWlbTnGmKeYDLlXpnyNEKG5WQUFaDZOGyMBetaYjO2qdf639xQI/xB7wIEFW6pF6mrd/cwR/YqSguzKAymF9uYgAjCH20pqqgpuXRA+Z0KgMcSxxg25st3gjGnlfHpNHf7L+SlReKyk1zkDGP/9faxryPHGX4TzvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841858; c=relaxed/simple;
	bh=jSu0uIpCVXJ1HgTQAKx99exuYgXmJJZk8yKbuxV+3hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhQgr56qcH8XQMsLIh6DQ5V8Pozamd+fBwEmifBCYofJLTNHfvl00wyWcJdJnqrij/Tz9E5THwJqbzu816eLvkthRJRmj4mGAY3ukG+N/IxkyLkv9c/SBOtvAvjTAnS8St7xYfXc73Iw0uDuWu/rJ6wSspLrFQ+g48fAjjVAQck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roUco1Go; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roUco1Go"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC6FC19421;
	Wed, 18 Mar 2026 13:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841858;
	bh=jSu0uIpCVXJ1HgTQAKx99exuYgXmJJZk8yKbuxV+3hw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=roUco1Go5OnspfnpqnhtDxlWbMrXh9sBjNYC2UpvfNVoQlSqKZs7feB2xozZ54L8o
	 m7hemoCTD4wIFtNqrJQfVPFAEKKRh7km+IN2BEOrwrSllNKf9PZ4L6P4Ulblzxz3ZH
	 3z+6G963EFl+5Y6H19xoSMwmGW2s3eoy2NPespsLvZIEPtmbxBLr2P+jz4dAb6oZD0
	 CFczCacrjL4MSFCoDX2on9s0/C7PwX0zos5mhRzobuP4F52BgIVeFeJIcI3yKMWz/V
	 hB7A7BgtqKx0Al71mKVDOvwfTS+hpMKKnWQA5U+PKZIXmOjqvtJTvsfZpDLo8shxt1
	 5oX5PFZSDXTIg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] Fix volume up and add RTC, PRNG, UART in xiaomi-ginkgo
Date: Wed, 18 Mar 2026 08:50:16 -0500
Message-ID: <177384182917.14526.9177017363053932457.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 21 Jan 2026 13:26:16 +0000, Biswapriyo Nath wrote:
> The patch series fixes an issue and adds some components.
> 
> Changes:
> - Fix volume up button gpio and power source in xiaomi ginkgo.
> - Enable RTC from pm6125 in xiaomi ginkgo.
> - Add prng node in sm6125.
> - Add debug uart node in sm6125.
> - Enable debug uart in xiaomi ginkgo.
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      commit: 3f5a8c7e7c3ea1c12bb78eb2ca1acf836fe2b416
[2/5] arm64: dts: qcom: sm6125: Add PRNG node
      commit: c6f654984a95ce3022ded8c9abfb933b36c90459
[3/5] arm64: dts: qcom: sm6125: Add debug UART node
      commit: f49c03d9a17ae7dec694d9ec40bd00c03ec350ba
[4/5] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART
      commit: e8f6f80bf10870d7b73c0436db10a61e3833196d
[5/5] arm64: dts: qcom: pm6125: Enable RTC by default
      commit: 7cfb1637ef685b27e5e07daf5912d8434c12ade2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
