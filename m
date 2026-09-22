Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5064DF4DC
	for <phone-devel@vger.kernel.org>; Tue, 22 Sep 2026 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790120109; cv=none; b=E1xLUhv0GzMc+hthTAQVhSC/KVQivOH4yDaKgMRfkmehnEyLd00z2qJjH7G+uciW2zchFW3x4EDpS1f2BBOBN7Pptq29YVd4rYRW572UjAWkHRTaFCbaXkqe3AimJxrshe9nZDS2SAwWy5Wn+E/ffhY8DE/b2YjSH+BUug6+DLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790120109; c=relaxed/simple;
	bh=Pu0LIyep8ECHLzZXC61LZET888f/1qOClryiAQIqaag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xo5I6YWatYbZyJUkRxaGEjV8GShT2DSfocqbVuHrJBZMkmjod1ULKNIybjJGVx5pByIgtjm3sRKKJUtPMyoA4RxyUWGkHBHk96XOpzzJOsdUz9gHeOw6dXsLi7B6Gi7nLXquaUhgXYQjDe0eEV0DMp17krRMxloXGGw8HLbs34g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHYqT3PF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHYqT3PF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C21351F00899
	for <phone-devel@vger.kernel.org>; Tue, 22 Sep 2026 23:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790120103;
	bh=Pu0LIyep8ECHLzZXC61LZET888f/1qOClryiAQIqaag=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OHYqT3PFt6Inu0sCytInvDAgTv/oQMI1RZJRl/PilqmkdT8cR5McvOzjBxEQZryCi
	 XTM+YWktLE3ACAzYuZvFYj3I1/KLj/bEvcbBlOO2j0I6ieLUShHAPxyavEM7fHqy6t
	 0KfkOI80Mb79dlpy4xZgNn7sknCr4FVew/75hGD0myVQLCzuYyw0+VssSPVheAgQ+b
	 D/rA05eXF4JlVleMk/Ch3JoXrWxMfDn4dYp4mcReftHgCGdApTEgXvzglsc5x8jhmk
	 CIS3AGjP72Orq+uZ9gS3cAnPcYSO5cxulNcyUIYYZNg28+zrSY8FHAhxJ4lE5Xi9eF
	 FgWi3oFC+HqIg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1651cso286856e87.0
        for <phone-devel@vger.kernel.org>; Tue, 22 Sep 2026 16:35:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxizEOKGKYofwSKB7xrXuqKlHvpd6x9d6O49SgQXyLj2aIn+RH08gKJfUvv1ZrKd0hHZio12iGjr88HBg==@vger.kernel.org
X-Gm-Message-State: AFuF++llhkBafM8d6OrCiLyUb50pMolfmukvL9OgEru0B7lZCDqbjwsd
	mCPJNrhx6wxwwOOtZNbPFUoclv9MLFPj/ffBcXNvwqncn5Cs70vz2V0hxbUTvdLPHprW3/uxrRW
	x72u04mCezKlu5E1uJfxwSFfryOXnWKg=
X-Received: by 2002:a05:6512:60e:20b0:5b7:50bc:32eb with SMTP id
 2adb3069b0e04-5b8d89ba16dmr156982e87.66.1790120102473; Tue, 22 Sep 2026
 16:35:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
In-Reply-To: <20260923-dma40-fixes-v5-0-709d160cde76@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 23 Sep 2026 01:34:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnVrnknUimH2dLUGnNDJ5qOCYiqv0vjW9pizVquo6TCjw@mail.gmail.com>
X-Gm-Features: AclHuK9dU3n-z4AwGVYodbotlqHC4cAWrTVWMC8tuLVlyvcNXYnE6Ii4cVkgZdI
Message-ID: <CAD++jLnVrnknUimH2dLUGnNDJ5qOCYiqv0vjW9pizVquo6TCjw@mail.gmail.com>
Subject: Re: [PATCH v5 00/23] dmaengine: ste_dma40: Fix numerous accumulated bugs
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.li@oss.nxp.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:30=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:

> This series fixes 26 DMA40 bugs.
>
> 12 were found while reviewing the Ux500 LCLA SRAM power-domain conversion=
.
>
> The cyclic transfer residue bug was exposed by Ux500 audio playback.
>
> 13 more issues were identified during review and hardware-manual audit.
>
> The method taken is: whenever Sashiko complains: fix the bug it complains
> about if possible.
>
> This has been boot tested on the Samsung Skomer device: DMA for MMC,
> wireless SDIO and UART still works after these patches, and DMA for audio
> started working.
>
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Ugh I managed to not update the patch series from v5 to v6 ...
OK let me fix this up, wait a few days and resend.

I guess I'm getting a bit worn out by this fix series that started
as a few fixes and just grows wildly thanks to / due to
the massive AI review from Sashiko.

Yours,
Linus Walleij
