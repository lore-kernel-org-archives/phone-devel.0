Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D189410D02
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142202; cv=none; b=t2N4sZtb+llbdAkwgiWMWp9CUABTER+6+6zGnJ66S89qk7rL1p0FShNqdkrE5oMihJ1ybbvE4W0QRg096vkdbDgiGfeyyStd8FdBBSxXdfU1mKoaEq+ELIfpeditEdjVhIgA9rWEFICZG5VrupG2IE7SWTs2KgI2HzWvAWUoqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142202; c=relaxed/simple;
	bh=cXst5rDUoPvdqrpxymDWEEc9mpgs2kGim/gpZkCBJgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnygJglGFtGAioskD6ciS/1oUqXUXMuDYTPKF3BG5vifv/dh9WWThTEHp2BXZcdIAGfjfWhjCAI6uBWb+hX0VIIbt+N5/PXOdfJYz8nVGG9TniA9a/azcRfixd4TdIFD46929MQye4sXHiaGTPpdVBWYyNE/Zu6cn4YDvrNhZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMDtP8Bb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMDtP8Bb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A344C2BCB0
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142202;
	bh=cXst5rDUoPvdqrpxymDWEEc9mpgs2kGim/gpZkCBJgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RMDtP8BbL7f/JmCmROobdz9CVTjd0dP8jtyXMurtE09BGBnAS39/UyftU+vsdu8ah
	 nnDAVdVhRxWoyXcAAhxFHfgT+Fri5PVDfr0k1pPapj4DLeh0ZjGDyv7DOt8r8O6i+O
	 PUQrKQv70RxZ2PpjNF5sJhQuD//CggsOXeb+ErkIeOc8ibcM0pNAXoyPm6NQ0LTo8l
	 IxuelO+nUen8ykTE6J2uQGePwDz3AhiYEyy0eifqRu+gYLUo+vnH1NznciIWnpUJuC
	 Mf8iG0s7Ua43CGGB7F4S7XOpioZ3MLPhObQZfPqllHAUIq+r7YjJhSME52eQESU0FI
	 befMcImB1bETA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7986c7b8076so137166627b3.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 04:30:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGFGUaUf3FTJcD9u4hOpOg9CAN3nNPiLbRPHpEBhKzB8+ps+iUfZNfIvfBAq5x8B4xAwVj6oibErZW5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0udZuFdyiC/Xxnddhgz5qYDx8mZNqARnhqB0ucz2vXj9JMlCO
	68+J1oMmmjsfFggR0ROP+5XivU5XWBT58T9wKzS/ErFsZLbNGs8DYXGgtn/I3undfl1PZSzMoun
	VQgtZ7GIU0io6+3I/uSK+rvIrATjvJ5Q=
X-Received: by 2002:a05:690c:4d47:b0:798:980f:6756 with SMTP id
 00721157ae682-798dd7c381fmr144551037b3.54.1773142201686; Tue, 10 Mar 2026
 04:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-4-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:29:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLkhempB+rFJ4SyJicg2xLMyBZDWXiXxg6s8emtxx-0ZfA@mail.gmail.com>
X-Gm-Features: AaiRm52g3-f91Api_ApII9vjzn1qgVjFG5MugyiAL3Ri-_UEyn-YzxD45IIsNDY
Message-ID: <CAD++jLkhempB+rFJ4SyJicg2xLMyBZDWXiXxg6s8emtxx-0ZfA@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a node for the LPASS LPI pinctrl found on the Milos SoC and define a
> few pinctrl states that will be used in the future.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Please funnel this patch trough the SoC tree i.e. Bj=C3=B6rn.

Yours,
Linus Walleij
