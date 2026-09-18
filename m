Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C84E1C8E
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 14:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742607; cv=none; b=jggx19pugTsmYaEh8OzcRhnasjNUICSeadtT6cDwYaEcFlNwXyODfM3W3dpQP+AvTBBTvXfmOryD1DxD2hOqsEyBfuRlyMn8uyYiWm7M3MnbNv1Jj9vTQLnXRHMyR/+XvqawxD5EE9Zzfak/VHCKSZ1IxDB1bZRzp/br2oJ77B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742607; c=relaxed/simple;
	bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=n/v/9mOY+k3vUfzCfagRmRXWx6Ytrwq8Kp69UgVhXBiTYapJLRw8tw4DgET9GpiZ6sQfWzu6W/hWfWb6xSVg31rSODalQmML36fx52A8IT6lgys2gbE1lQsWw0P3RYCMzvpG0ZUt1zSh0FXAN5A2hvAOQ+sO8++lxYeJk7Kd1p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=bhpqsMSp; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="bhpqsMSp"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso901347a12.3
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789742603; x=1790347403; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
        b=bhpqsMSppMXS57/rwie8aIPBboNhq43ehVhkULnvPa175uVXt/MpzOT9JFAr2kUNNe
         DkPCRPkKsoGVnHdYl61k5IMGAeUM72QS0zEOVKdaulXWmVqJ8l7IA65JogktZnZIFhJi
         bSzVzs3BM1lJ4W17eHfutGUJNO41Bm6NAqs+NE6AbInBEMEnKKztopefxcLk1heRFQ3M
         lDwZhHqtzdqxUQ0xnL185CVb2U7BXVtpoSAuJseN7eyjVQ8A22A1HZi0BuuVtuBplWq/
         vEEfRjsKnkdTDeFEHQRWfLLcbWgLKGnIRiuz6/fsdMgLq8FbG8+wjnPRXeg2VGZErN4u
         Xtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742603; x=1790347403;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iryp186ezY+gCaEJKKJAixL+bjwtfJ0T/atOJE5WaQA=;
        b=byi61YGhGxplPJm89sKFGaubOKT/Lg1g6ejzG0mZpxM8x5vboLIXDiwgsQ58DHMqht
         iSJfD+7BxR0FS4T1oAWXddotonBekHwAuSj0ZNjqOAuNbKf9vHlY5/Yd4ymtz0rSZMYi
         rUIQy/WzXG+sVAdJM06J2E7hEJF/OHVgIx46Em64jQCn76dWzlXmsYPJ9Iila8+FkxYn
         WmAyitiVPkWwm159vxllVMkPSkzfwfzE1GCQ2HhYX16MoJq8dm8Uig8GW22FdTuMD9UR
         LopMlSI3W1jYWgRGzKuSe7D0oSmzhZqhVQrFGlPtnVVCIPz4ohWl6H53uNFuEbC+/3RN
         cgDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtPTHHpBiy0PlKy8T8j261ijNjjgXxipJajH7rAeLsJLt2yH9JSRJ60KooRSuK81BA5l1T5hPcNEHMzw==@vger.kernel.org
X-Gm-Message-State: AFuF++lzorf7HLYqX1vg2PVncW0P+E62lbIS+BxYGHzJ0OE7S/Ag8niB
	NyGKDezf6PLKZTC1FlO2alsfwb0TWiW7IdsxFF5JqBRiG3j3HIEDYC+0KfxiNFF+Hfc=
X-Gm-Gg: AYBFou0dBjeR3ONAejHOpRxKOGqKVtq01prjd5j7nLsKPopATqmR26vvW0KM/I5+/0G
	+x6zdyv/T9EUtjcZWGYKL83CiLDulWGhWIVIhHBUz4w3oAcDDmc9GGXVsi+f7Ho3yyITkS/zq+o
	FyPl2HycbhakYTqJrvkqoXeJugaosfQFNJoyWH0GLuO6tTZjeou+xwi6ZZZQghjyFUpOpTUK1EO
	n71yE6y6wlUYOHG4P5fbNcyy64PpPbteBJXLwrbRjxktXg6ldE3LGkWzHigYo+Tzq2xRdEnwnEO
	4ONu+X3Jh8NmxaO7Z1b0TuZriQY+YkUnzjTKenUAgqj7QhbpnuI1w5/5KJAmipC2AN2SeOyrh4G
	L1a4z5aL+1p+Z6HhHft8oZycrHm0twap3ICre8whoWj2PThdeYFYw8XeHaq1of1VOsO5316YAZg
	NmP723STOcXFYlhxdYkUTC9DdSDkPwGchwsc2sYJqlpMAAFRM31by5801uWP2h8FvotOWxrlSDK
	b8zl+9cm/iiyPc2VfrHyUCq2AQAqClLJm7n3xF35nQ=
X-Received: by 2002:a05:6402:5111:b0:6a9:ab6a:640f with SMTP id 4fb4d7f45d1cf-6aa531c28c8mr1640375a12.37.1789742603374;
        Fri, 18 Sep 2026 07:43:23 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm991778a12.11.2026.09.18.07.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 16:43:22 +0200
Message-Id: <DLIISWYS60TX.BBXK30H05VRL@fairphone.com>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
 <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
In-Reply-To: <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>

Hi Konrad,

On Mon Jun 22, 2026 at 10:23 AM CEST, Luca Weiss wrote:
> On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
>> On 5/22/26 4:46 PM, Luca Weiss wrote:
>>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>>=20
>>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>>> equivalents in its place. The qcs6490-audioreach.dtsi file can also dro=
p
>>> deletion of power-domains properties then.
>>>=20
>>> This follows previous commits moving Chrome-specific configuration to
>>> the correct file, leaving kodiak.dtsi for Elite and
>>> qcs6490-audioreach.dtsi for AudioReach.
>>>=20
>>> No functional change intended. The clock-output-names property will now
>>> exist for both Chrome and AudioReach devices but this shouldn't have an=
y
>>> relevant effect. And WSA macro clocks weren't added to Chrome because I
>>> don't believe this would've ever worked given it already referenced
>>> q6afecc and the nodes were originally added during AudioReach bringup.
>>
>> I think it's better to keep them, if only to make sure that the result
>> of dtx_diff isn't outside the expectation of a commit that claims to
>> only reshuffle data for these platforms
>
> I documented this in the commit message for this purpose.
>
> But I'd argue not putting (likely incorrect) wsa_macro overrides there
> is the better thing to do. Probably somebody should've taken care of the
> Chrome platforms when adding the wsa nodes in the first place.

Is that okay, or do you want me to change this? I'm still of the opinion
that adding a very-likely-broken WSA macro to chrome is not great.

Anything else to note? R-b would be nice :)

Regards
Luca

>
>>
>> It looks OK as-is for Elite and Audioreach platforms (for the record, I
>> checked rb3gen2 and FP5)
>
> Thanks!
>
> Regards
> Luca


