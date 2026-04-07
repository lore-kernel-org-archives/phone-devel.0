Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A4C3A0B24
	for <phone-devel@vger.kernel.org>; Tue,  7 Apr 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775550110; cv=none; b=Z6dHZB8/WVy6WppPHk8pxsN9MZEEjH2VujViYi5HoxjDZSwXBugyckz8jBhJEt0+O2zRJjFVBNitAnPglC89sNQDvW4ZJC5B8Sd+J8LN5R3haqqI61AdapgkGWDWwOucPyCKJk+IEoeDrQfOJAXgyqx9eUSYUNJZYOYelXhlaTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775550110; c=relaxed/simple;
	bh=GrX5EJt4t9cQ0y5PJf5xNnceKPLkSMXbMni6kC0vHEA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dFkV4PxcpvUPtCT0FnLixJEebuaGPPBuSVPJamHch1cJWK0q454hhpazlRu5FasHDnaQbSRlS5tjj9dIPfAi2W6XM64epEFLYmJEMWOlGIiPHw+yFVVsE1mXIpgEiB/aaYESECa8QmW/5PdfYPFxpHI2Pp0UwHLq4Tx4p/FqoWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=2p3KwyGA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2p3KwyGA"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b886fc047d5so723858566b.3
        for <phone-devel@vger.kernel.org>; Tue, 07 Apr 2026 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775550107; x=1776154907; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=2p3KwyGA/dKlU1tpK/sdHOTXlcKnBJLR36sSHWBQUul6dl1xvxMzUz5qOMgHD48V2Y
         HYmsAtUUJt0GFdXiQ5B0reuR+2cJhahNvaUXbHPG3ZNUL0C/O7DpfGiwoNd6LSkM+hLz
         2wjhySye0BQOnm4wAejTHtFchMH4wWx268uAzqL6JTPKYRkTMvl4BNQqNrGfX0nszMU+
         xH9bL8pKJPTXllaTbI5q85ENnev7r3kTsSLhLvkWDnlKgMGMOzcMnsnTgz1avn1+ftxE
         jMOzUhnln7k1uCztmg0oSuxQ+xyFc4Xf2Y7JFDTtzruAo4kJ8nBOAFG7C0h7aF8O4nLZ
         wmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550107; x=1776154907;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=61qWV5sp3TCv0+h+N/I/PUI4iC1Lq3vzfWty1ImfKAk=;
        b=VKn2ZvuGZ0xPSRVlPA/C8wDWfmRsmVhUQkP3eCJGjq8AeqJROoLbObeDzFLQBp+4xq
         ix1jqFFRNYQut0vxbCGcFv+cyQ+7uDdsDzNSMFNbqYqk09cePtyQFd0/gDFP6UgNH1RK
         Xr+2Ck8SQIrbPkteZiFcKKNQnEI0f0pocMMXf9H56IPdtbrqT4QkoloOuQaKedx7UdVf
         uukKJ1gbL49zIf4XBv1L8f4cBH/4z6CNTeODlcEljkue8Yq+QUgDrTgi/rjB2+Yxzdot
         eKC1BE54HdbmdPJETwNeLUTa1KkxyLkEJzzdBnkTQAWpJZlnJzQKhRpzi/fr4kbb6Z1c
         hYPw==
X-Forwarded-Encrypted: i=1; AJvYcCVQyl6g57aQZLTjqGk4zkWGYdyZ9Uc7KXC5O7O4Rq7kuvd6iRBtHTmTF8Fr8vGUWigqNxg6y7UWWeMicA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yRs2LMC8qzuwrYksXTLGPhgKejdYglCrNuYTRAjkciACQfPU
	GJc19miGkfy63+R3MGvKc/Jp2THPi0OhiFiT4V6oRls4aCQhnaX0bsPj4dNhp/X4rKKxi8R8zYk
	J3HwxD4o=
X-Gm-Gg: AeBDieuJ7CL1bWmzsCu8WtQUkU11GJVPi8pOsJHbdmjmVewvKUnN8BtBTNtkDXpcICd
	WZWyldXF8CQDqytMH2UYbraEHudgNX6ow6otmsinSZibbbFcWg+lnY2rB7wO/Y76OaCSJT3yXCH
	dmyFLjnp3EE2me85mWmIbQ2FWIWpMJV+KgnXdUPIXFXSdUBlE8aDubTdwYQN/K/EfBy7Oga6xm3
	YN5eyELcMGDuGM1r+qszgilEB2h2J3+7UnTTHXNktHvYXHdRDYk6xk9CwDe36PHq3MxYLOwQhAf
	GKbysNNFDyaowMmdBvNIS6Vw8RzB7dkXtU52SgwIiylRL/FBqpyY+27KrjoaVDiephl8+ZbGySd
	ZAC4pYx+5GilUWbtstK/cfzS/0vzsP+rydw0EWMFr6Lm0aoRHDVCYbtFwifLokafXiwxnEO8YT6
	5Gm/RuJdAdfugsus7IDXvdJmszjDqqJsvmjnfcUNPPu2kxLebS5H4Qf6xEpxgHxuljUi3jQDa2X
	b5pess=
X-Received: by 2002:a17:907:c002:b0:b9b:6869:bab0 with SMTP id a640c23a62f3a-b9c672f45b8mr892867266b.2.1775550106969;
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3d028831sm525473666b.59.2026.04.07.01.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 01:21:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Apr 2026 10:21:46 +0200
Message-Id: <DHMRZE7498YA.2K983P59ETZ7S@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos
 compatible
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
 <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
 <20260405-rampant-green-harrier-eaf680@quoll>
In-Reply-To: <20260405-rampant-green-harrier-eaf680@quoll>

On Sun Apr 5, 2026 at 9:54 AM CEST, Krzysztof Kozlowski wrote:
> On Fri, Apr 03, 2026 at 05:00:23PM +0200, Luca Weiss wrote:
>> Add compatible for Milos SoC IMEM.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Doc=
umentation/devicetree/bindings/sram/qcom,imem.yaml
>> index c63026904061..38488e28a6b4 100644
>> --- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> +++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
>> @@ -19,6 +19,7 @@ properties:
>>        - enum:
>>            - qcom,apq8064-imem
>>            - qcom,ipq5424-imem
>> +          - qcom,milos-imem
>
> Wasn't this imem binding supposed to stop growing and switch to a
> different style?

Then I missed the memo. Is this written anywhere (apart from LKML)?

Regards
Luca
