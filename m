Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD78628FA9E
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060786; cv=none; b=IEmhCADaxeRa8YKUjiL+IovcnU59gIaLlVG+wOgSQrV7oBV3iQ+Gl44uwl0dCUdTF6oElyZ1cye5ixRj8WMtDWmhkDkK01y4e0v387xZ6Msy4uu3tVDNJS3ZfDuJpR3O3xIRgzb4bkRhNY6+b303eM52rA0P7rDXhLKm/dVWbQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060786; c=relaxed/simple;
	bh=DnetqG4IpAFzDIBOiu8occs+wrG3pJXMqq/lD/+CZz4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=H+LYBycIxx86PQLLLfwkSrsG0PP8ztIF4O5YXJX+udtHtdS9X91TWx4XQT7R/3DIP3XB7IwFWlS75gOYxDNPXwox0LKkTGyiPdbqqd05dDtia8z+M6xoQpY2J6BrrO/Kd79wsTw76+q2pn9pGiGnfslXj+U4VAwVNDWy8RVmp0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=U/O3yJ0D; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="U/O3yJ0D"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so1143076566b.1
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752060782; x=1752665582; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxzY42f4mxHddEBUOVLLBJrN9aKCSop49so8dLkLQco=;
        b=U/O3yJ0DN6baKxv96FqzOocjvo45nVp8hpkpdara9EBtCODvwbHYkh85hmgXQuepCQ
         6r+M7hwY/lWt7+6gGFPu/PgBusr4yBAW0SBJPSOjroaY3T/b2oY/IhMWRD0DHIc5FECB
         KEJkW4b2jbJlXiQjYZoNJqO4C5Dw9R5Cm5dnlNSxoT3SVMPLsiBWsApd3ArSED2iJRF7
         kNPCzd9j3+jTSuCY0CCcEdqhf5laX7gIPG24ABli63mSv+h+tw6Dl+HgQ2x5angC6rX0
         1h6oYofb4mNsVNb3jbyVYROXUtfcyHKdIi5b4dPflY+h7ge6u6z3C/7Y2+Qt9V+jLQW7
         awuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752060782; x=1752665582;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KxzY42f4mxHddEBUOVLLBJrN9aKCSop49so8dLkLQco=;
        b=PS7NlFnOgQqeImrx4LDBtExsBxP30J2RU/DIpNbF+QrfQE3RD7xUN1bpH/5JPjhw76
         IOiqRC/uuYY+BNvAh2Xb3tF2Zw8MZCM9urtWeedd+yVTRSQSMhlRcNrPOoB4j4fNtrZc
         +Um3eGBeo9oYg5/ExVKgNWXt8K02M33NtLFGeyCS/XvysJiG+MW6QH8F0X8Q3C0CPHTu
         AUAGsvLNOMN59+iCOVmF7rMuMc+YahN+4c2dI9/O8GIyjJVM5zN9fj7c6HrEovdnsyVk
         ccu5NM8z3FE7gzjilKPkWm0jVbHGADPifLYdoWDzz9ht3xmV+afRgpLwECg7G68HR4rX
         VMQA==
X-Forwarded-Encrypted: i=1; AJvYcCXs18X0kQR9U4KbKCBeUiHeNaTWMeDHYmjzQza5P9cObmIbWpu/htO8wV8ZIbpz76ikmh2EQ3eNgCmu3w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yws6n/B2Lb3eh+u8PxI8g+vqnIpQMz+fMtmHErNWEGVP0/icJm3
	LQV0lFurUcPL6wRTk6JO4mFpoXl0oAi3OpD9J9fl9gHGMa+9kQK2ezrcdf6GU9mGp9c=
X-Gm-Gg: ASbGncthTHdL5uIE4lieRUXcAiD9B9/71I+aRqfzEDtY7uqrr2PVWLXX+dljm4L2IvS
	xUf8E6mxBI+bHIgQWQrY1USZneXtm/24o7vswfn7Vx+dRnj4WZ6vQi2vWu4Z+zSRO2eaWIbx8ro
	Em6v0z9aAlITx+e1Vod3/VYjygcE8NFpIzqxSSjLPV4wKA04qdEomiw91tBV4NMsDzURo6RoWyL
	OB9uH+qveWORh8vWAQg1gpVAxVUZ5ifc6MPibrM9h5QweWO0ba81X0Valvps8N11c8a8ic270Y7
	luRbDF3wiqOO0nRNrXdj4ONTM686ZzB3tKHevv7iS9AkFQbhZRY6Jdd7B5qK74o+e1nX3QUKlvD
	6cM2IXkj8sfA8rQaZ4Cc6DuGO49cgYx/igIZt8apdyw==
X-Google-Smtp-Source: AGHT+IGHM8DEDRJmkix2Dsy2SirVJ7BbYv4bV5HgWFOqwJ5zCocvDi8X0Hn8U2z4qSsef7dQPV0KjQ==
X-Received: by 2002:a17:907:6ea3:b0:ad8:a41a:3cba with SMTP id a640c23a62f3a-ae6cfc3c275mr235877666b.43.1752060781983;
        Wed, 09 Jul 2025 04:33:01 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1edfsm1080433666b.180.2025.07.09.04.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 04:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Jul 2025 13:33:01 +0200
Message-Id: <DB7HPNBDW93U.2RC0AF8T8RG5Y@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] Add Milos RPMHPD power domains
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250707-sm7635-rpmhpd-v2-0-b4aa37acb065@fairphone.com>
 <CAPDyKFonLENQbafjo621hHPkoWjMNoQ5GRNeNndpezMNnM1=sA@mail.gmail.com>
In-Reply-To: <CAPDyKFonLENQbafjo621hHPkoWjMNoQ5GRNeNndpezMNnM1=sA@mail.gmail.com>

On Wed Jul 9, 2025 at 1:30 PM CEST, Ulf Hansson wrote:
> On Mon, 7 Jul 2025 at 12:18, Luca Weiss <luca.weiss@fairphone.com> wrote:
>>
>> Add support for the rpmhpd power domains in the Milos SoC.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> The series applied for next (with a minor update to the commit message
> for patch1, according to suggestions from Krzysztof), thanks!

Thank you!

>
> Kind regards
> Uffe
>
>
>
>> ---
>> Changes in v2:
>> - Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-ar=
m-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
>> - Link to v1: https://lore.kernel.org/r/20250625-sm7635-rpmhpd-v1-0-92d3=
cb32dd7e@fairphone.com
>>
>> ---
>> Luca Weiss (2):
>>       dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Doma=
ins
>>       pmdomain: qcom: rpmhpd: Add Milos power domains
>>
>>  .../devicetree/bindings/power/qcom,rpmpd.yaml         |  1 +
>>  drivers/pmdomain/qcom/rpmhpd.c                        | 19 ++++++++++++=
+++++++
>>  2 files changed, 20 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-rpmhpd-dcb5dc066ce2
>>
>> Best regards,
>> --
>> Luca Weiss <luca.weiss@fairphone.com>
>>

