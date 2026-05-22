Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8043D3B6C03
	for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 12:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453403; cv=none; b=oVYNOj9QWI6Z7qzCAvow8mWNjcGwQCpkqHvtwwW+K849ZrgjfTzHuBGaOBsE592A+DuMT+lRGHL4XqPdvekuwd3FUEMPLGAV3UG6G5TxBidByUPOKiFiMmxdeAYy3t1+XZqKjtScVs33ttsFweEAfgUPHvpiAFoNIk/oAsQugs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453403; c=relaxed/simple;
	bh=ez0hYLD+nS53bPDoJ9heVWsVQpr8/69Rd8zaPJI4Zv0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=bv01NJz70g/DnkytDP/Yn15Tceomdzme4CFwIxOrKJTjuuYRU5rsH9ucnfOFOs7NxrtUirEYa0hwMmsjZqu7dHmaK9IICJmamRJ1ol5iKa571WbpQJ+HIQz9K6qS4Uzlzj32Bec3ucRZzJNUJ0+1+FVtxqMiWMf287e4unreTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hAbeCpKP; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hAbeCpKP"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1367078266b.1
        for <phone-devel@vger.kernel.org>; Fri, 22 May 2026 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779453400; x=1780058200; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aJSWrARkjD03TI4/Uxwgwntrjkc/Y5COT9xgvg7ans=;
        b=hAbeCpKPSy1+LZ3JYjyc6MzswTMOI4SVRhxWAeMfwK8mSUIzl+tL4UHuyLs0QUe8xH
         5SSLAJnPJqOdVFx/cse8ez7qLYwFLVHeXDeJ3yHUb8nJF0ffq3ilr5KhVkieqAw02o0e
         kNqndlGERucxAtibz5yay9ecD6AseFvqK5YdDbshEm9q5NRdQxli/lrFS+Vi87q1xAvQ
         eVgyy8zVDx4CFZQv3ispp6PFOiLhkCjQe7qSUwvgbvdsAWhvRB6YEwS4veAt0lqm1jXv
         b1wlTOdweHZFigv7Eu/SVHzHSNxEFAkyvzNoy4T90uaKDUBPU4krUrIfGG2/CPYrb3EE
         uVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453400; x=1780058200;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4aJSWrARkjD03TI4/Uxwgwntrjkc/Y5COT9xgvg7ans=;
        b=GljPffL6qph9Jx09wwUITOphRztCvnhBxRXQgrv97RjZ4IVq+D0xRj0ZZC1drZzqSz
         iNfCKKKtFKGRxKJwCwVA45eBKh3Nlzo6KLvGaejmcDi1PZCYFkADU5jQUFCfQ0b0ngi/
         VpKlipDqQPHk7U4GjDsS8dzDnz3yD0guE7Vnq75woZ1JwPtLyCnajlz08TxEye4SP7fQ
         c4Z7fifOjy8PE98G6cpU8YGa0OdVC2Xo8FrrGMuUHKIdjeKpHM0nzShn0d6acNq6ppv3
         xH09hz4ZUfMonYn9cwl5OP+qikR3/A5xD87LdKp7cmOsOAtoT5hg/Qgb2A/C5U2VQ4kL
         pKfg==
X-Forwarded-Encrypted: i=1; AFNElJ8UHUXK6Objv+wIB1uskN/+Is3W5iRZyVW6iwR0MhrSkHlLcr5Gu34ZcjHRK3phnrwIIv2aVoUz9YJvnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlygIesRJU49pGRiPdkXSiFMeKC1vlZC8QcKe7TR6pLqqrgAVj
	Q0lx63Aw2Dx95TnAvLntX8g267PscsWiM0nXVToYTfOxdMsytUHdFE2QDgemU5/d6A4=
X-Gm-Gg: Acq92OGR9cD4ocNIemomHXKRjCqoXO1n0h5u53rZk2hsWHb9OSYlITadUCquGoQEUm8
	3ta8zJOTLHCVMojdo5ntYzaNHMyJiKro7duakPPD28kJfqJL3xfr9U594VaJfYU6dKrvGkTSspy
	xH9uHmzInaK9qd5XOR7tYrXmaiCQL3A1CrNgmaYbQV/SDJN3KMwC78DXda8amwM6B1+4gKvvYwA
	4yyluDjgMyNv4cvn+Rv7WyGRTzJGJfJ6CJzz5c1V9XHmJ/B0Hugp7Lpjhh+ts4k/YNiMUBrtTVN
	wlRwjUiwmoZBzG9Ni74LLhrkn6z5eSUvvd9YwPnHKMzjG6NaK0T09u9DWaPkWh81BpjGwCJnusp
	oMo3YNQP9rJmBsGQGEhL01/a5e4HtNDOeEC1mLGeu/aHWpTiCjO5binKKy6oYal0kt8Z2wcNTxo
	HWM3Eey/4XgLHJgrVUQMzRungdkpPlamuJOxwY46qgjn6sO8hsn+4OJd9OApv06xlcFcmh
X-Received: by 2002:a17:907:1ca7:b0:ba6:8f34:b419 with SMTP id a640c23a62f3a-bdd23602369mr246277066b.13.1779453399721;
        Fri, 22 May 2026 05:36:39 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d023sm640495a12.5.2026.05.22.05.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 05:36:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 May 2026 14:36:38 +0200
Message-Id: <DIP7L24WNIUT.2OGXXQG15MPZ6@fairphone.com>
To: "Val Packett" <val@packett.cool>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] ASoC: codecs: aw88261: fixes and cleanup
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260518220906.347958-1-val@packett.cool>
In-Reply-To: <20260518220906.347958-1-val@packett.cool>

Hi Val,

On Mon May 18, 2026 at 11:44 PM CEST, Val Packett wrote:
> The Awinic smart speaker/amp drivers were merged in a very
> "downstream-brained" state, where configuration was only really
> determined by the binary "firmware" (register list) file instead
> of properly participating in the ASoC system. Let's start
> untangling this mess. This series makes aw88261 actually usable
> on devices like fairphone-fp5, motorola-dubai and xiaomi-pipa.

Thanks a lot for working on this!

With this series, and simply hooking up the two amplifiers in dts,
speakers seem to work without any issues, getting rid of the hacks that
I've had in the tree before!

Tested-by: Luca Weiss <luca.weiss@fairphone.com> # qcm6490-fairphone-fp5

Regards
Luca

>
> v2:
> - Add missing sample rates to the switch statement (turns out we do have =
them)
> - Process the conversion from requested values to register ones directly =
in
>   the ASoC ops to make sure EINVAL is returned early, from the right plac=
e
> - Do not include untested aw88258 fixes.. (why did I think that some supp=
ort
>   for it was already present in the tree?)
> - Do include TDM support, logspam reduction, a newly discovered mask fix
> - Remove misfeatures inherited from downstream: async start, fade-in/fade=
-out
>   (hopefully this won't be too controversial?)
> - Also overhaul volume control to make it actually usable as PlaybackVolu=
me
>
> v1: https://lore.kernel.org/all/20260420213250.215465-2-val@packett.cool/
>
> ~val
>
> ---
>
> Val Packett (7):
>   ASoC: codecs: aw88261: support changing sample rate and bit width
>   ASoC: codecs: aw88261: add TDM support
>   ASoC: codecs: aw88261: reduce log spam
>   ASoC: codecs: aw88261: remove fade in/out on start/stop
>   ASoC: codecs: aw88261: remove async start
>   ASoC: codecs: aw88261: fix incorrect masks for boost regs
>   ASoC: codecs: aw88261: make volume control usable
>
>  sound/soc/codecs/aw88261.c | 612 +++++++++++++++++++------------------
>  sound/soc/codecs/aw88261.h | 179 ++++++++++-
>  2 files changed, 486 insertions(+), 305 deletions(-)

