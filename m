Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85E2931F4;
	Sun,  2 Aug 2026 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785696027; cv=none; b=qWWcGZ61xwUSNc+/PI2PYFKijL21uhW9q+2xA93gs+bqFcCKvMcy9q0GxjR565Qzxcr69+szTr8+EaH+B3UdPdCwihRsV8/LGRlzIKRU+IC14tNeet6qilnt1DT6pm8yYxjxnXnCYE0Inx+rKh1luc4S6XR1Yjmk4quiCid2iA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785696027; c=relaxed/simple;
	bh=y9HT8A6pBggcIwUQpILavmFg385T/iqaVriqJdvguD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=udckRElnuCKv/Z9j7dEoxYDpklPanADPqPJJqkRxF2DYWXEG04hwbYt6/a/3y8D3Xwy50gDVzaNb3tQlDClKRglhpWKuHbakV72nis2FaUwhtR6QaEUnR9EzKZcwKdLMnaCscfQBYGeD+zlPwywJT0pZ1uJNByE+fbn0OFM4C/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=oy+VTYA5; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="oy+VTYA5"
Message-ID: <ba0fbf6a-024d-425c-aed3-ab0ee67246d4@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1785696022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bidyQdiqCU8Owe8UANKTCiu+UaKhtS9enMa+cYxACuU=;
	b=oy+VTYA5rRr7Wa701h/B78tFJXeONndKRmEBXZLXIQFIeVr20lLpXD6Hed7gmSlFvOzMuo
	RdjL9OhUXkB2CWXF/yu16oyKkH+7rXaEMqKKHQs3gREPmucJ6YNnOyZS3EdGRmWLtIWr5r
	tFpoWxgepOD7OXeljSsRtdRjx1z8viMrNT/dHPiMN3woFPhdbFtPXIeDXDTeN9KwNNLMkz
	xPMgqqULgH0ywYpY9bqlb6Zzq0Sy0i+PfKgentDNdLRScX7gu90VBKzWdvp7gAXpnj74qM
	PXBJUWYfh3D3WZE0Qn/zhNaq3X09aO/AOjkngI1+we+avouwAZxyE07QsBS8Dg==
Date: Sun, 2 Aug 2026 20:40:21 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: rsi: Fix types to appease CFI
To: Johannes Berg <johannes@sipsolutions.net>,
 Stefan Hansson <newbie13xd@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>
 <a0ab921cb2172a07b37d2a221917a78ba6e14da0.camel@sipsolutions.net>
Content-Language: en-GB
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Stefan Hansson <newbyte@postmarketos.org>
In-Reply-To: <a0ab921cb2172a07b37d2a221917a78ba6e14da0.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello Johannes,

On 02/08/2026 18:24, Johannes Berg wrote:
> On Sun, 2026-08-02 at 14:22 +0200, Stefan Hansson wrote:
>> Avoids errors like:
>>
>>      CFI failure at kthread+0x124/0x1cc (target: rsi_coex_scheduler_thread+0x0/0x1b4 [redpine_91x]; expected type: 0x89fb613d)
> 
> Yeah, well. Everyone gets _one_ warning to send patches that actually
> build warning-free, after that I just drop them without notice...

Could you clarify what you are referring to here? I don't get any errors 
when building after applying this patch on top of next-20260730:

$ make -j4
make: Entering directory '/mnt/linux'
make[1]: Entering directory '/mnt/linux/.output'
   CC [M]  drivers/net/wireless/rsi/rsi_91x_main.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_core.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_mac80211.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_mgmt.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_hal.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_ps.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_coex.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_debugfs.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_sdio.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_sdio_ops.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_usb.o
   CC [M]  drivers/net/wireless/rsi/rsi_91x_usb_ops.o
   LD [M]  drivers/net/wireless/rsi/rsi_91x.o
   LD [M]  drivers/net/wireless/rsi/rsi_sdio.o
   LD [M]  drivers/net/wireless/rsi/rsi_usb.o
   MODPOST Module.symvers
   CC [M]  drivers/net/wireless/rsi/rsi_91x.mod.o
   CC [M]  drivers/net/wireless/rsi/rsi_sdio.mod.o
   CC [M]  drivers/net/wireless/rsi/rsi_usb.mod.o
   LD [M]  drivers/net/wireless/rsi/rsi_usb.ko
   LD [M]  drivers/net/wireless/rsi/rsi_sdio.ko
   LD [M]  drivers/net/wireless/rsi/rsi_91x.ko
make[1]: Leaving directory '/mnt/linux/.output'
make: Leaving directory '/mnt/linux'

FWIW I am building using Clang/LLVM.

If you are referring to checkpatch.pl complaining about the 
aforementioned error line being too long, I can wrap it if you prefer that.

> johannes

Stefan Hansson
