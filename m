Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FD2175D53;
	Tue, 24 Mar 2026 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362383; cv=none; b=BWl8C50VWpuKrZ/TlNm8xWPaUsaCpz07xLgpTrqs9x05DuLanPp0AkCQIb5BX6gAuXCdH8M8oP6ZpTQ+VTN/fnMWxgQ6DCf2zQOLUGKzfZBe8omU8uy1yL9NsmhZegCargxR2BM6Coc/NOAIi8Zm2b3r8/VAk/1Ua/LghsPPURU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362383; c=relaxed/simple;
	bh=52atFKA062AVZeWqC1bg0nJSW4KY4y2rV64ZMQODBRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PR9tbP3dQEwP60ZInh+2qhaDeo/ViPr6R1aAca1AC25B4bPnvG3GVWTo//oDoVC9nIci+if7RdcTxU5cqIXj6KHvpEaxb/9s+ARAJtN+a6exfaKZGZwvK3FQBl2/4QJT+zN6BVZ56ZSrXwzaojSX7q51Kew39ezMG4ICMyrb880=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdaPCe/4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdaPCe/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AEBCC19424;
	Tue, 24 Mar 2026 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774362383;
	bh=52atFKA062AVZeWqC1bg0nJSW4KY4y2rV64ZMQODBRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZdaPCe/4rvBaPJba4ud6veZ4JJAIen6MZf+hugOLkxJ4c+ZG8ntu1FYR6c/JaXCCt
	 p17zQeL8Q3xF/FXb6LkdmQnY8Rhxz5WuatIgweqFEaAoW9q8z6pOZFK2WtIqmj3I/y
	 xZ6IYBN4HL5BRbVWBREcfo8/eURMHPeYwSkL87cnm+OVDb9p1tvNEN9UJC4OZOMnle
	 HcuUC/IJqERJOscN01rIa+GTlEpbWnI6U6VemSYirZFaGKRWzG9xX1qS8+k9z0Ytc6
	 iHeuWhYyCP0S530P5C6M0WCqUMP5iftJXSFLCsiqaaj6S1QDHwGO0RO+3MzKNqPJ7u
	 G1GMy36M+/X+w==
Date: Tue, 24 Mar 2026 10:26:18 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
	Christopher Brown <crispybrown@gmail.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Amir Dahan <system64fumo@protonmail.com>, 
	Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v6 00/15] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Message-ID: <20260324-amiable-practical-camel-cc9e32@lemur>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8d0c3d305197730a53ec9ca95b28f8df95c777a3@postmarketos.org>

On Tue, Mar 24, 2026 at 02:13:43AM +0000, Paul Sajna wrote:
> b4 got rate-limited by my email provider for the last 3 patches, I'm not sure what the best way to send just those is now :/

You can use the web submission endpoint.
https://b4.docs.kernel.org/en/latest/contributor/send.html

-K
