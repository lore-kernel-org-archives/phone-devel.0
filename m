Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D53191D0
	for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 08:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770969748; cv=none; b=esYEE2g+bBXdpA0DsiNRSQtKB8K7Wvo6QvS74p7H8P9E9uX0rbfZWFreJ2FtiG5Gox9+Mu6mxyiRfcaDkDQMbckc0A7Q84mf4H5bpcuCJSPiqIPISbtyb+82e6GG2UTzkB+keiaXbKeboMNQsiCehCUOdPXq0n6OwqaLxa26wFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770969748; c=relaxed/simple;
	bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Y+Kx74aXhgPlZJje3X9fInkEmheMwuO3fQFFUXgv+BVQnfWozUwXYqGXUWQ5VvGMyniLLJdeIwuYs4Iw4/gas4JsEw1x2h0Fh1D6iQMzE22baX2WSeqX8Ji91MZRr7TXeduW9V05IFwsJoKIhDqEOOoqU+Q85MTAwJVpEaIr338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=eGQMVc9v; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="eGQMVc9v"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f992167dcso72854966b.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Feb 2026 00:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770969746; x=1771574546; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
        b=eGQMVc9vAIHjZisWn1LqjOvpJFrWgRNjPWe/zc5kU1I8Yg82oFmbAgIxqeQDVpIdnm
         ae9akT54wFHK4R/oxLg97klYq8h7eLjU321xhetr7kOvnz2JQ1CDXlXTH+macb48XI7q
         Z9GG9uJ0gtNsBC33s5P4uLZ1fB5S2nxZGAx0YzZ46E5f7GyaX8EZQSJtSRgW+HETkisd
         BB8BckSN42+Z881sSh3pJpVe+ZZ0jchPC7Pn7oGdCowyDdfVmfc2AJlPs4dA1VBBtUOe
         qQJwnhFA9fktYQpHcMmWKB/flXwgpcgaWMPoAuKju/YCKdv34OUOPdNX7Sq1iD6zInXN
         pFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770969746; x=1771574546;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YuUImcaHV7Y1d4T5vAe0F0a09U37V8B1PbdWpCRJ28k=;
        b=EECgsqzxucuGEeIxcoo/ShgECnvp/TjKTU/gSF40vNoaY3RzxcAel69Ea9B7WvwUbD
         Kfx36YNktljJ4op04yN7vKd969YPTCMB9IeQOZQ9og/znM47injJBDL3I44TP/pPR9ct
         g+81JsvHkuMmgVaavTCsNfTLTdiuO2M3n+lUt1jpF5di0GjMPbM3ieY2QjYNud80CmMs
         j9DeKf3YXGhkP5duVMxhTcoEG/iricnhMXLaOGeTTRee/gDwiRXuXCxyclr11BUQQ2Gh
         /+RXBdGklBmSqeJGHGk2x35VEreBQDOo7JSJEH9gkZ8D5zWUMQd90EIJmlAcyVczmUQm
         RSIg==
X-Forwarded-Encrypted: i=1; AJvYcCWJOSN1KlQ4JdYDplWhnA9pkJ8BJZF9iR8GfXKABmyCnW7WWEmnhjRnwUowvnrwR82ob45sVFOFVQg8Yw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyShw7AfIU3NZmkMzH2lSTgQkJuPnHSi3JoCQHaxX2jPs3jDfGx
	3Lzq5cZyb8GIDG0AuWkvKU9a5ob5BdwecY0daO1KpADZMbkJInUvgQaXgLub1b9wdBQ=
X-Gm-Gg: AZuq6aImKyZoSBCP650DRiQNMFJGiwqQwtBOscEw1LBoCnSu8+gj4KR8ZjIhOuw8Mhs
	VbG+NuW+9e6jgKV/jwkdtfL7ULHRLwZz13+MJcsDjsPnl2FJfOGBFUO86g0lg8Q7FPjA1KKk2SE
	v9Mw96pyc9ALjtFxU45YHRVVxw3cP6qesZO2G5SKw1ycPCUbq+I+cEKcLPdUtzb4GLjc+l4TcKF
	L+IaA7oOhL9Xd8pqYVKLMM5MLws4HXR74btWMNyiKghqZb84GInofdwISMPiaI/Ls2kR7ulpWmK
	9dXHGZ49u0LDV2aNiPMVztfBSpVa6OtEz25RDIa2Q32ZOcJFfHK2K2amnf0XlTNUXBkXABxGoie
	RJcCskZWQ1sZpHiitzC9ZuLmje16d5RrXirUz72MdhkEspNZdP8L5bfN0Lr7TaeivkJys37lIIw
	GBo1gJk7Mnrw2EoANdInnLiddSewjXIGq+GUxJ357DqhpjqE2fu+HGu8M7x1BWnNJhNYpX
X-Received: by 2002:a17:907:3e2a:b0:b83:95ca:23e7 with SMTP id a640c23a62f3a-b8fb4176f79mr42051366b.4.1770969745217;
        Fri, 13 Feb 2026 00:02:25 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec35688sm234531566b.51.2026.02.13.00.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 00:02:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 09:02:23 +0100
Message-Id: <DGDODOW5NS9N.AS3NWJ3VOID7@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Add CAMSS support for SM6350
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bryan O'Donoghue"
 <bryan.odonoghue@linaro.org>, "Luca Weiss" <luca.weiss@fairphone.com>,
 "Bryan O'Donoghue" <bod@kernel.org>, "Robert Foss" <rfoss@kernel.org>,
 "Todor Tomov" <todor.too@gmail.com>, "Vladimir Zapolskiy"
 <vladimir.zapolskiy@linaro.org>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Taniya Das" <taniya.das@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <3ph8XeidoxkUIsK7qiOH29pde94sdwa3ReWKVVrPabgS5enIAmwVAC5plyFnBMJGKQBnxFB6df6j69OMFIeavw==@protonmail.internalid> <20251114-sm6350-camss-v2-0-d1ff67da33b6@fairphone.com> <df4a6a77-9004-4dbe-9b11-7af2bea7e068@kernel.org> <DE8JJCQA0C4Q.35NEED7XG0K0V@fairphone.com> <17e7ebc9-3b88-4334-b87d-1bce6d5bb120@linaro.org> <893b97ad-7d2b-4408-bab5-2cd63fdaa33b@oss.qualcomm.com> <28f33d3a-6866-4bdb-a1e5-d193dcb7d4d1@linaro.org> <a15bbbf1-549d-4603-ad6d-3a578b548184@oss.qualcomm.com> <0a114896-ffca-427a-8761-977dafa73ea5@linaro.org> <0392b41d-3a95-4c77-9267-bfa3e207013a@oss.qualcomm.com>
In-Reply-To: <0392b41d-3a95-4c77-9267-bfa3e207013a@oss.qualcomm.com>

On Tue Nov 18, 2025 at 12:50 PM CET, Konrad Dybcio wrote:
> On 11/18/25 12:08 PM, Bryan O'Donoghue wrote:
>> On 18/11/2025 10:06, Konrad Dybcio wrote:
>>>>> Konrad
>>>> vfe170 is what we have on sdm845
>>>>
>>>> So I'm just asking Luca to try the sdm845 method of waggling this cloc=
k since what we have doesn't work.
>>> It's of course going to work because this way you're not calling the
>>> code that throws this error
>>>
>>> I was curious whether you know the actual reason why this is being
>>> done in some other GCC drivers
>>>
>>> Konrad
>>=20
>> No notion at all, perhaps as a workaround to this very problem.
>
> I tried digging it up, but only managed to find that there is a signal
> between titan and gcc to request it being enabled (perhaps that's a
> fancy description of hwcg)
>
> Maybe +Taniya would know? (context: sm6350 gcc_camera_axi_clk stuck at
> 'on' when disabling)

Coming back on this again, anybody got an idea about this clock issue?

Regards
Luca

>
> Konrad

