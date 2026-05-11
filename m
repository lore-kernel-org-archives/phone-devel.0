Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E11B3BADA3
	for <phone-devel@vger.kernel.org>; Mon, 11 May 2026 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491712; cv=none; b=PDTdY5rMapCuOMcUrPG6MChcziL9GKgEe8lf/qcVM1B0vdpNnYI02HUvhIzL809dD5ysavk5YAhcspldMdT8bLMaR5mCHM+njUKuyIcFv1aFqbHPhxY+htYilzekArsmbc60Z0LDKWssIevncuM9B/GC8HidA3FoIteYtKlSWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491712; c=relaxed/simple;
	bh=cfOlR5qjLH6F0mgDNpFieNzkfYgGlRYjxfxkEfFlJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G60dCGuR28QFnx0YA/bMvcbXAUXQPnhKSV0WfpzJBd3t584m9Fq3aVV+m1VBK1HJ8ETjQqK2RiQGIPyM1tUimO5o8cG6Af4T5IEnUJNojLR2fRSFI0NhfYmHRJTLsOzODxm5/teoiT7IXj6tYFuBWafpglGhpgv3z0U5s+OQ4uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iAFbkgdC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iAFbkgdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE374C2BCFA
	for <phone-devel@vger.kernel.org>; Mon, 11 May 2026 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778491712;
	bh=cfOlR5qjLH6F0mgDNpFieNzkfYgGlRYjxfxkEfFlJtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iAFbkgdCexDixdQ1ZcTDnztqRaDhEtvzGhmVdx/T+WoH0PnNQ3HgXQotA61Lhqoe7
	 vjQi7E5Q78xBt9F1tBY8dS7QJTCbL2VMQBbVYxYtrWjBUOuGwfMltbKR04Ri07yT9S
	 Tbzyn0/xFUa1MS1Y4zbAzCH9pzyz4l8EKOvoa3TtiZREK+XuntVTslLjcs4imw6xtj
	 hU7weOo4UJKcxcb2G16dQJSFfZr6TSjm87MdJLpIxK2SQT7szRZAyy6+x7lTABQvU3
	 CZzfduG9O1M2VOjofRVCJjHNMUm2a41q5nlnD/CG495qJPw3RBXqQkEPurh/S9tqh2
	 Vib4zjjXbNSqg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so4383760e87.3
        for <phone-devel@vger.kernel.org>; Mon, 11 May 2026 02:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ97kQmuVtE4XmH0h65rtl/Pw1zvQwXRNRQx6MJGWZJ6dtbLs0XWVmCvA/J20lSZJUxF50KDLoGsviywuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YypYewcUQ4c3RZaynqu/UZYnpemcYZ5VDOwu/a8T8Pd6ucjp14R
	A3cVOLKhMs9RbEe4945NNGT0F1N0g09PEoPAVsEprvTiFInqfLm+b/u50ijssiQNgwGqFKkoWWB
	vItfQNPLdVzQTh4qOkPjwc1tsVRZU3nM=
X-Received: by 2002:a05:6512:3c87:b0:5a8:6f4a:6a62 with SMTP id
 2adb3069b0e04-5a8b729150emr1970564e87.41.1778491710434; Mon, 11 May 2026
 02:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260510-pm8xxx-xoadc-label-v6-0-49700fd03005@smankusors.com> <20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
In-Reply-To: <20260510-pm8xxx-xoadc-label-v6-1-49700fd03005@smankusors.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 11:28:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
X-Gm-Features: AVHnY4IhqEH9lgst_x7YrGT_DKgqpsvJ-gMtJBV52g5yHUpPfofeDWqPW--0Ep4
Message-ID: <CAD++jLkEsw1EHQ1bBp3R-0N7ABL6P9Wz7Kd2CEQcyXYPshTF7g@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: iio: adc: qcom,pm8018-adc: add label
 property for ADC channels
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 9:04=E2=80=AFAM Antony Kurniawan Soemardi
<linux@smankusors.com> wrote:

> Add a new optional label property for ADC channels to help users
> identify each channel when reading values from the sysfs interface.
>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Makes sense to me, nice with some roadsigns in this djungle.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
