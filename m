Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590843AA6;
	Wed,  4 Feb 2026 13:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210935; cv=none; b=rroJAUTJPY2HHb3UhBtT+o/lG56FqTFVh5bd7/u7Uczyt3usUF0ci0I+QGPlNltTseIKsjMGgyovBxHfCcNhtgc497/PmQYDqdFCdz1VynufrjROqbobxTbc5S3JsIw0sYs54KCkQLqJfIiZGcKvODu9zokCzj0T3Rn2BZY1UJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210935; c=relaxed/simple;
	bh=02d4/3q/zFQxPynJd4XcqNpUBi7WTFJGoOXNWFYSYtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNJNswtKo5fchLHg+16pGTrqK4GL8dBO7SS84o4IELf87vSdYK7ekbK5m7IvsA9LA501O1eQLprf/9coIRiLObfWY0JfuNTBrrr+2C8ndf3q6Rhrhxgzt6Q/vxno0cohZbuZAGYJOSLsIp9jTQJ1jQA7EPB6CasIOqlDNF24hqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNWCAIa6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNWCAIa6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CD7C16AAE;
	Wed,  4 Feb 2026 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770210935;
	bh=02d4/3q/zFQxPynJd4XcqNpUBi7WTFJGoOXNWFYSYtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNWCAIa65dm29/1g4DlBYuxfM7L6pU5Dz3bYFOwlFw3YCnBAmNij3xxp+MiiPfWAG
	 pTR7E95oF9nRTJyZKTLHbLA4u8DVsk4UrrZUt1yVSme/QPa0wvOACbpiLoZGKmbv7q
	 ckiwaRjPUk1D6a3hTQQ73ANbterB8IzvEmU74OyV4NqLl0MzwxnN0n8FWrCFx4gWgI
	 AAHzzkHx6GTvYNCcce9EZRzZcqRpvMwp0t2i/FjU2MqBPFQ848q1DmCcyBEXLim3wk
	 IP6juSiwjzZhuQ1acBr1rgsk794PoGXiIUARxJH+B7Vt9ESNHwduNyEIyZbsXhmXLt
	 NK6gs+cGIm9Ag==
Date: Wed, 4 Feb 2026 13:15:30 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v3] mfd: bcm590xx: Add support for interrupt handling
Message-ID: <20260204131530.GA1169221@google.com>
References: <20251013-bcm590xx-irq-v3-1-0ceb060d2ee8@gmail.com>
 <20251023130335.GM475031@google.com>
 <b0cffa2f-6ad2-40a3-a5ee-5df6b2918524@gmail.com>
 <20251113132648.GG1949330@google.com>
 <3ccdc769-4730-42de-9bb6-1d6322111fac@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ccdc769-4730-42de-9bb6-1d6322111fac@gmail.com>

On Sat, 24 Jan 2026, Artur Weber wrote:

> On 13.11.2025 14:26, Lee Jones wrote:
> > On Wed, 29 Oct 2025, Artur Weber wrote:
> > 
> > > On 23.10.2025 15:03, Lee Jones wrote:
> > > > On Mon, 13 Oct 2025, Artur Weber wrote:
> > > > 
> > > > > The BCM590XX supports up to 128 internal interrupts, which are used by
> > > > > various parts of the chip. Add regmap_irq-based interrupt handling and
> > > > > helper functions to allow subdevice drivers to easily use the interrupts.
> > > > > 
> > > > > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> > > > > 
> > > > > (...)>>
> > > > > diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> > > > > index 5a8456bbd63f..fb6afe277ebf 100644
> > > > > --- a/drivers/mfd/bcm590xx.c
> > > > > +++ b/drivers/mfd/bcm590xx.c
> > > > > @@ -26,16 +26,29 @@
> > > > >    #define BCM590XX_PMUREV_ANA_MASK	0xF0
> > > > >    #define BCM590XX_PMUREV_ANA_SHIFT	4
> > > > > +#define BCM590XX_REG_IRQ1		0x20
> > > > > +#define BCM590XX_REG_IRQ1MASK		0x30
> > > > 
> > > > This isn't better.
> > > > 
> > > > And now the nomenclature is inconsistent with the one above.
> > > > 
> > > > What is a mask register?  I don't understand.
> > > 
> > > The IRQxMASK registers store the interrupt masks for each interrupt. To
> > > explain this more clearly:
> > > 
> > > The BCM590xx chips have up to 128 internal interrupts (the exact number
> > > is different between the BCM59054 and BCM59056, but both reserve the
> > > exact same amount of registers for them).
> > > 
> > > The status of each interrupt is stored in the IRQx registers
> > > (0x20-0x2f), and each bit represents a single interrupt.
> > > 
> > > The interrupt masks (that is, whether the interrupt is enabled or
> > > disabled) are stored in the IRQx_MASK registers (0x30-0x3f), and each
> > > bit represents the mask for a single interrupt, in the same order as the
> > > IRQx registers. (...would IRQMASKx be more consistent?)
> > > 
> > > Each register stores 8 bits of data, meaning the {status, mask} for 8
> > > interrupts can fit into one {status, mask} register.
> > 
> > Okay, so the "MASK" thing is just silly naming by the H/W designers?
> > 
> > STATUS or ENABLE sounds like it would be better, since a "mask" to me is
> > a software term which describes the methods for manipulating these kinds
> > of groups of bits.
> > 
> 
> As far as I can tell, "interrupt masking" is the standard term for
> enabling/disabling interrupts[1]. It's even consistent with regmap_irq setup
> code - if you scroll down to the part where this register gets used, it's
> passed to the struct "regmap_irq_chip" to the field ".mask_base":
> 
> > +static const struct regmap_irq_chip bcm59054_irq_chip = {
> > +	.name = "bcm59054-irq",
> > +	.irqs = bcm59054_regmap_irqs,
> > +	.num_irqs = BCM59054_IRQ_MAX,
> > +	.num_regs = 16,
> > +	.status_base = BCM590XX_REG_IRQ1,
> > +	.mask_base = BCM590XX_REG_IRQ1MASK,
> > +	.clear_on_unmask = true,
> > +};
> 
> I find it a bit reductive to just call it "silly naming by the H/W
> designers"...
> 
> ...but I won't waste any more of your time about it :). I'll rename it to
> IRQENABLE in the next version (though I do have mixed feelings about
> completely changing a hw register's name...)
> 
> [1] https://en.wikipedia.org/wiki/Interrupt#Masking

I know how masking works.

However, I was unaware of the nomenclature used by Regmap.

If the registers are called that in the datasheet, you should keep them.

-- 
Lee Jones [李琼斯]
