Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22A4262D0C
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852530; cv=none; b=hzYqKOxhZ/gwKoy9sGNOrKmTUiTWFaapBdjheAmhvSvuTGA2LekJTXY433pJi4+YCXWFONjx9958HBK9ZziRIDXpZ4KzREYhsPlE5bHb4yKYLWkTKANWzaP9YogTeFUcZn9YJ81ExWbwe//+1vwoM5iDG+hH4MjC3wUvzjyhpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852530; c=relaxed/simple;
	bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=gUgcIe7SaHTJhzt+t7zUp+oPxT7R5WQAnvLblG+h3VknkA/1DX9Q2fNaO+zGD5yw4UPDugXll3euvcvchShwqizUsgWroqMnFybt9zDG16YBHLGin2PpoRUdaWHwqpZ2qUwL8lbApO+VUVNryIUjKp59CtuN7LSAPubjZLqZcdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=qs5YSOO0; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="qs5YSOO0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so2734252a12.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 04:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750852526; x=1751457326; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=qs5YSOO0LLGQ3vi6rgHcweeS/ep1QgOkxBFP9k0ma2vtkXALRY3UA/PIvNQtFlCrgA
         +s597SFYgiVvq1zi+seQXmRMiQO/JC+kKqEKG5wONMcnjRl3w9F6Ot6VqXM6x/DDuFl/
         5N8IETSyMMYnbOSnO1rkJTyc2c/5W4dYFJx/6uu+ceGGpeHa66CgYZ/19MZnGegDcs6y
         Rr6ijT6wXL4nzef8MaP0nEGRBsG0dINE5pQRZ8Exz4pnfgNKAY4isZbTtXAfeMPm3KXD
         P3ESbmKN04yIlKkbzpmFSNyGEWv+l36Z6YQaYn/EP9iZlmB+2wjs0XFhEmB8o95IvsPI
         6PAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852526; x=1751457326;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ele4kC/bFjkVABuTlMtPoVal/q9sn4Mx7Xjke1CK0u4=;
        b=Lt+JZPDirs03KnHgsiDrVWDeBdudFhGdbGjf3O69tF/2WQdY+8LLGVd0D3VWQow4sR
         eny8aRZhbUoPOGk3LJtgbc96pwbqjyeB8obOM7NgIdFQ2CgfwpW20Kw1xBOfH6i8HPa0
         ix/VlkQj+RvQYTSqFND/RMFYxD/bKHiFrLL/xtRhKrrcq20RH5fWgdi3b0UcJ1Fd6IoN
         mzBacMNsQMzltegbAiDAIY5I7H1TRQMH7doeX+Gbl7VFJeqURYyy67G1rgO2ovQCROYN
         WcDYZqKQe6NT1rPxuSKlofta+qdHjHd8ByB24bwjMTVOy/Q731phCZmX6y3jRAstP9d6
         R+mw==
X-Forwarded-Encrypted: i=1; AJvYcCX39VF7whYVZF6Crbh00rIAd7QrupEM0XFcJZ5AWmd92mEcMke27nLwJlN9TdnZVt40X0av95HEgkCtNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxayQh1enKis0REfBafFmTUIOjYJOYzUAUaE+BLYz38l5EZTNkV
	y8L0+/zuAPh1MmIImM7G7h0r10cMMszHv0y1h7iBsr+weQerGtGyV2hbFqsAkUDFICA=
X-Gm-Gg: ASbGncvtiwohsO/vUXNsGqn6jy50itOuWmSuAVVio1NP7hX2X9GwfENKZKrdPnLz8DD
	wyr1cVWAjUAywoSZj5kkt2FQBTN4dO8gImMfrTbMUfYr7bK8TG7jJ4PAWm81hFGmy4xjexwczX9
	9VnOo9xFinyUeFAUb76kHxeUt2QgrTdEltUa0UnAUPfSJ5aXK4KLkndoC76fyGRZmnaWRrlweqt
	l6+xYtQoTLIVjVfZPzep2/eS77Qy/+/pxSK95XI+RZ0kxbmOxvM1dFTwPNBO6AecNjnaIZRFuTd
	gg/1szphZyNBWOirJK6iBHkM9680u5fC5pcvi5tDzduEgQEnlI7xft4u4PYN+nund0UxvtHxp8A
	unOq1mt1yZw26CFMmIYSBk+LMPk33ymA=
X-Google-Smtp-Source: AGHT+IGHwtU2WcLOLeMlMlhviB+W5ro/PgSmY8OoYgsUjPuqlDw7Eu44hCDzY1aMqXqaPDEZvGOrnQ==
X-Received: by 2002:a17:906:d92:b0:adb:4917:3c10 with SMTP id a640c23a62f3a-ae0befc3ac1mr209592966b.60.1750852525989;
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cb358618sm29256266b.102.2025.06.25.04.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 13:55:24 +0200
Message-Id: <DAVLF5WB0IZU.3EZCARZSQO050@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-phy@lists.infradead.org>
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Wesley Cheng" <quic_wcheng@quicinc.com>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Abel Vesa"
 <abel.vesa@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
 <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
In-Reply-To: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>

On Wed Jun 25, 2025 at 1:51 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:14 AM, Luca Weiss wrote:
>> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
>> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
>> 'latest' HPG revision (as of November 2023).
>>=20
>> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fd=
a3246e09dd39e16e2ab43cd1329
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> Both the original and your commit messages are slightly misleading, the
> HPG (and the code which is indeed in sync with it after the change is
> made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
> You most definitely don't want to set the entire register to 0.

After reading your message twice I think I've got it.

Code is correct, but commit message is wrong (it's saying writing 0x00
but it's not actually doing this in the code, just setting the bit to 0).

>
> With that fixed:
>
> Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for taking a look!

Regards
Luca

>
> Konrad

