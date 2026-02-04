Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B330288B8;
	Wed,  4 Feb 2026 13:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211108; cv=none; b=DsvDeq1ex42MW+gTxMdlwUNR8c+QxQ8UGTdtg3vTUuQxicU7KqN39frJEdgWz0XW3ryS2k0+vghof674RIibz6xEObBK8s83THigsDM+/KfC2/+QIEbJNyPW2q9qQbJlThLdj1q+C9ZxF7lilxaxwkdD2ukFVKGyqJNWhfNVlQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211108; c=relaxed/simple;
	bh=BXwiOOSfxA2vJmftKUX4ZKhYetd5VCDpZWLrDkT00gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoBqiHyh2nOkypiFPBmrL0nfP/QaAvFu8YNdupdMmNug9z83UmoLNh9/wtloKVb2x0ou6YxdP9y4vehhtCGlzsWbFS1DtUzyHoY1pRcDhgHViGItmC/L4+2zkPT7qT1goulftZlj5wiAumvOsJeLl3dMmikSpvX+qKtCTfJf/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYvMeahI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYvMeahI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E75EC4CEF7;
	Wed,  4 Feb 2026 13:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770211108;
	bh=BXwiOOSfxA2vJmftKUX4ZKhYetd5VCDpZWLrDkT00gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYvMeahIP51DzlnxngziFHPVmhsnN2KBxIVCIYB4S54+RNztIc7U8lur99XAdxi1g
	 3WAv4jrpnPX0xwFb40+cmhPoPpptW2GAVaFQRvlwkzr28/kPB519/UbzDlmESU5hlV
	 civmI4lFcmMeRlRDZkoGN8OVwkgCOMl6bdgSMTWUJdo3E2HHTQj48K0veOCkum/D8W
	 vJN4DwVX/V1Phbvs2T6elJnyFXw88Vbv1dsCxQ5Sdv8tqAuOGY0wSUSzONC4y5TyB3
	 HQpqCh9dFugIf4VoXJjKKc36zrTMuf0lkJKdlIhKQ9M4arBQJXGpMTub5S4VfWwvm/
	 7mio8+XwNiXxQ==
Date: Wed, 4 Feb 2026 13:18:24 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v3] mfd: bcm590xx: Add support for interrupt handling
Message-ID: <20260204131824.GB1169221@google.com>
References: <20251013-bcm590xx-irq-v3-1-0ceb060d2ee8@gmail.com>
 <20251023130335.GM475031@google.com>
 <2153fb6d-17d3-4cec-b348-894599743b93@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2153fb6d-17d3-4cec-b348-894599743b93@gmail.com>

On Sat, 24 Jan 2026, Artur Weber wrote:

> Sorry for the late reply to a 3-month-old review, but I missed this comment:
> 
> On 23.10.2025 15:03, Lee Jones wrote:
> > On Mon, 13 Oct 2025, Artur Weber wrote:
> > > +static bool bcm590xx_volatile_pri(struct device *dev, unsigned int reg)
> > 
> > If I've asked a question or showed uncertainty about something, it
> > usually means that changes need to be made.  Asking what "pri" meant
> > wasn't a one time thing.  It shows that something is not clear and if
> > I'm asking, others will wonder too.
> > 
> > Can we change 'sec' to 'secondary' and 'pri' to 'primary' please?
> 
> That function was named for consistency with the other uses of "pri" and
> "sec" in the code; this function is passed to a field in the struct
> "bcm590xx_regmap_config_pri".
> 
> (Admittedly, "bcm590xx_regmap_volatile_pri" would be a more accurate
> function name.)
> 
> I understand that the pri/sec naming could be confusing though. Should I
> update the entire driver to use primary/secondary instead, or just this
> one function? Or just the regmap_config?
> 
> The regmap_pri and regmap_sec names are also used in the bcm590xx struct
> which is passed to other drivers (currently only the regulator driver),
> changing those would also involve changing that driver, but that's fine
> by me.

My preference would be to elevate the ambiguity everywhere.

But it's not a demand.  Do what you think is best.

-- 
Lee Jones [李琼斯]
