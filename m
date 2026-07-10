Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA232BD5B9
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691923; cv=none; b=tKRGDavMbaw0iiHmUdeo2w/dESzqXC2uawCipxKDraDBgeSXSsV7eFqCmtZsHJgj3KRrWphS+MwoquDDJuFiIVbIp0Hg2EyuikJMz1LM5md7pMZAY613S516D7xYTL//TKkM1il0e1+CGN/IvWyeVzlPgoGVuq6PGjDx7beEMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691923; c=relaxed/simple;
	bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Tvmk2RsRU+qrIJQm8tRJhGua4JKDDF27KFgAUCatGuZHsIXp2kMe6+y/9qYtzUfO85UCkhPwlPHOSAwO1iczv4M/YW3Vf4ITEokKkblbcHBI2ljxW6kBOaZV742tt+VJgh/K0HxcqDi/AuaBoCVu5z7kyw+7oEnvIS4MH2cB2lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HHVfu76P; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HHVfu76P"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15e2dab83eso142766066b.1
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 06:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783691917; x=1784296717; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=HHVfu76PljNItpbRCBn4egmQy6/B4UiN8P92zrc5eGS0B0Q65poEDe3B2DnA7Z6Omj
         TRLYt4zjm7+5inPC/IUfNvo//2eI5r69qMPEjguJsqgWCz0/oqUm0c3NrdqfYuX/ULk2
         KkBgXb/3Fk+qsAEF0xXvZ/6cpluqpHOdwJ8/jxUa5Aa6t3zw/F/7mgJSHK+gLGs/IUfZ
         2hF+DhfL9i5fU3Tf6lYwSsn0vroM86DXkbciETq8JhqFW/45D6CbeC7wAEUTIKuNktYd
         6V6IHuCITuCDgPxye6L4kDBBwpgQRO07k3FXBQCVSbaPCAoPvg1aNvS/tNygqakVAKXv
         yHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691917; x=1784296717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDMFkzxjs/KXUSaVb8duhkY5CEnHTeJPvE9VzQ6FDQc=;
        b=FlvQLJxggODAwIXEJjWgBhqwo4xmE9SgP8LwmjftoQOGoLk5ZdsXurYWUwLryF42Tw
         VuLb1XybfYLzPo8khNm8nvmQhNI6CSph9b68zcFbZfmOko1sZHYNNurvfra2KMLxskix
         Is3aseooP/vIJjVO15Z5AWHLz7P5jzPzUewS/4OtGwqrY7fUJmdMf1ouF46ZRyx3cL70
         i4u6aRjlbODgksvZS0AcAsxHBhrg67IJuRMhOFBgQydWlqKC/7udFZEuzLvB69/vx40+
         oDWoS3BceJlk986A68FzHodYpFcmd72kzTVVDFypQaBZtciHpXRHrCYlKFLqaFHcPrve
         gfqg==
X-Forwarded-Encrypted: i=1; AHgh+RqwNFxoiYrswzv7kqqlyYJc65nTiXxelX9HW60AIomGKjI1+MQCNKEOf84Lnjne6pGbZKZZF8xMNMjRnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXeTZTQcQq8y9OE0Mux7xGircRJ8rA2uS9PhU2ftyWZu64UGig
	ofO1qBMy3rzjNBnQ+NZpSysUT4JhYx70onCLa28lry2OmjD/aTmmfzX5J9qEok46I4Pj6CZNFgP
	h9LJU55o=
X-Gm-Gg: AfdE7cmHjt1g/ZpkTxfqLbQ9FtqVTdBIrjMksPeN0SWKgZewXAd/AM7EMuStOwNII0K
	EAoKDVqH5cJbJd4+uoQxQUVIo8cxfIMoDUfot51vie339rsMXJfNFk9E2pcrwiSp49KJO8pFPpg
	Hng7FVtTNbG+qiDAu7McRtoN5HXlIS3XqBajfOpjewx/oCKn7rLI6GarMMA5MsFJFHZa9sjcN8V
	pym06lxMMLHgXB8gc/O2EAyPP9r8byi4lIvNhtOL+Rz2vbK9BIvi4sxx4go3WDRI1pc5w4Ux9QT
	pQ8qgpwDQ2h1b1JF9ioCeoFEvZa5YKK19GUJVxHH93eFau++yX1FyXAkdzQVCsIvVG82UVL7R/r
	YtjWIY+esQ9Axc1IPl7g3jPDt6R8Q/xOI12m7CRElioT2gFK3NkCzFNNpHWW1Aab9z5cAsD9Egg
	0bWFb5h/z1pV/1hwTkK/J2yYvyIv4klPOme5YjcuZtt0NCTxuv8VZsTzS1+Q==
X-Received: by 2002:a17:907:990f:b0:c12:695b:8876 with SMTP id a640c23a62f3a-c15cded1355mr392545366b.5.1783691917105;
        Fri, 10 Jul 2026 06:58:37 -0700 (PDT)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d3859f69sm407039066b.27.2026.07.10.06.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:58:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 15:58:35 +0200
Message-Id: <DJUY0I0R3DGG.1YC9D7H4AAI0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: milos: add OSM L3 node
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Georgi Djakov" <djakov@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Sibi Sankar"
 <sibi.sankar@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Alexander Koskovich"
 <akoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-2-ae7f4b09bc77@fairphone.com>
 <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>
In-Reply-To: <bf766035-54fa-4e98-8abe-22cf0a229ffa@oss.qualcomm.com>

Hi Konrad,

On Fri Jul 10, 2026 at 3:44 PM CEST, Konrad Dybcio wrote:
> On 7/10/26 11:22 AM, Luca Weiss wrote:
>> Add the OSC L3 Cache controller node.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> I'd suggest to squash this series into 1 big patch, without patch
> 3 applied the OSM driver will engage and perform sync_state (with
> 0 requests, so it will vote for 0/lowest) and the system
> performance will be tragic

Fair point I think, I took the structure of the patches from sm8650
which had it split this way but yes, it doesn't make too much sense in
terms of keeping system performance alive through bisection.

Will do so in v2.

Regards
Luca

>
> Konrad

