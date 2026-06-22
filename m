Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBA238F639
	for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 08:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782116628; cv=none; b=ARM+w5xctJsHIcxRMK++MmSVOQJij0IQqVlHLMgEe9rUHxyrT4QVCQ4EycAvan5yzBzziNckEqhcc3w0QjxtExv+dTBPCt59GW1HebIr17sPyhVltA2tkn3hXuvKLXsXj3v4tOXkqNcGuzWncSwm9nVFMlLFiBIeRrlUgfbZlU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782116628; c=relaxed/simple;
	bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ndSZarN13RFpFFoSUc4kd9tCqH/o3w5fyS5rKuW77GyuHmWG+xSTsuM9fUkg2m5rR5TmN1dlOnyZYcks3A1fuwbqug7iJk1Mz0FS8hQKa60U5HV9B60FmVRqGNFbAkHeWf7vbDToTvd5QgUURDl0m0TUDDJv9E+xXvhlyGqGguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tJlpr39N; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tJlpr39N"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c074ac8adaaso481242466b.3
        for <phone-devel@vger.kernel.org>; Mon, 22 Jun 2026 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1782116626; x=1782721426; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
        b=tJlpr39NE7yGwJMaIA+4fM/aUP1Hj/FhwSsW4fmioS66ZE3OOwUcuWDkxxKVorhLis
         ZMgOkPIMXJQe+NTG5ZYUFKC1TkiBSBqKtGC7VCVYnihn2NP+AObCyhcwr0k99YRahxiN
         Ut8EEBIEMisEfVkXJO51acgdZVEq5FvPCJIR11zF6xQfdRy6LBjqUIw6qH2RoIglLiIF
         FqgRTlmv6E9iS5OQu8dskQDGJ+6Gp4luIohKuR30FITZCi48YwX3TgPH/IQ2nMW2uXcJ
         1DfMYK0YHbESilAQa+voh/KPbAutCuxeBgfUBsg9UNj/I5+5DrwJvBlGwqm7pL/rbVom
         oesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782116626; x=1782721426;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QayaNVYMdk0y95PRvg6tdQ2LISbdzw2ou3QRiLXOzkc=;
        b=YyoigSvRawp6/JWtYqhUYoP7mzygm7q9WiNHTde8cbcBd33SYJ+foIYDUG83XQZB+3
         Lk+fRcESLNJx49f8W3tFS163BunYc1yha+r0N0v3oAgooCMWYnoBjAQSbLRoAUIkKnAs
         FHmP0H9+PfJv5H7cGTUfEWUzJV+U0tgkcT2W0E4piJ0/+hIPye/rN65oxJeqZ/HyezpA
         rAvfxN3ucnsdQoSe0MZhCB/H+Nb7vv7n3cORcIg1DDsNoLAVazyxFsk00uIDaiUUTeZO
         S9lg3DNwpryJGc+LLt77OYvOaI2e2orPjsdbjI9bN8ixhjOthimJb4WGrYYGzQjrhEaJ
         d2Jg==
X-Forwarded-Encrypted: i=1; AFNElJ/6Q+7a0EsSZDgTKodf1rTEBJTp+PMAxHNJ9EhCCbuAulQfIeBC2ilPnrh/DvtE+zAqPUew5gY8k4euQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqtQMpfszfJ6ZQ72hOiFXRaYxT1hIl16YNVINqC4r0cEI4Q4q
	6GrpxymxphN2Xizn6znTZsZ6niRVu/KYK/MN42vYy+WkUatbRplf1DUEnFphqcjUxHQ=
X-Gm-Gg: AfdE7ck9Std2Iutt89e0aet2RQx3WQe0j/9SSy07fip++U3vWXLCxhE77e42EurMfL6
	uLgBkA1P5BGvoVbCxwjW4aVKV5fZxvI3zXeDUL9MH9O5bitleSK6fGV4D5+dMsedMDn6VdFlHFq
	sgkTTrPRNpX9zbSRN24/qO4FD5aOSVByQWqltlhydQfiRM91Xh5nWpYkDl8oJN8rXtUA6B/jDAz
	yGlu3B8bUVRDeYBCq5guTtRe+iPAYFkpVkZuGqU5dd3+Z/6Kx4ipuhSNcyaik/2uwJw8Byx7JJn
	5viGnuCmvLqlPLer2BpCx/bLSgHRChfV4mjooqK0FQt3o4jWhcvtrG1iqIiHAOXV515+qfY3RYC
	v84K5ZgvZNWPZhcNZjJM2mr/p23iiatx+7HpfnGi3WRL2cwQaAQhYOWL+q1SL//zdNlZf+2g/Wc
	n/M9WuEng96RsDLeHgrtHjJkEFrituw32RpV5JcRvTFNlpFM7A+Y5CT640IDnAuAYxdjDpEaUEX
	WK3Ynnuu/+wqZAlE4YxJpDg5jI=
X-Received: by 2002:a17:907:3e9a:b0:bfe:ed74:524 with SMTP id a640c23a62f3a-c098f33a0f1mr679421766b.51.1782116625717;
        Mon, 22 Jun 2026 01:23:45 -0700 (PDT)
Received: from localhost (2001-1c00-3b89-c600-b4d0-bc9f-f60e-913a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:b4d0:bc9f:f60e:913a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac97aesm310087666b.30.2026.06.22.01.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 01:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 10:23:44 +0200
Message-Id: <DJFFMB9BO7GF.3CIRW26SHUSD@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Elite-ify LPASS macros
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260522-kodiak-elite-macros-v1-1-487661ac1270@fairphone.com>
 <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>
In-Reply-To: <b39e4b4f-c166-48e1-901c-51694cf8172b@oss.qualcomm.com>

On Wed Jun 17, 2026 at 12:05 PM CEST, Konrad Dybcio wrote:
> On 5/22/26 4:46 PM, Luca Weiss wrote:
>> Due to initial kodiak/sc7280 bringup being done for Chrome platforms,
>> some Chrome-specific bits still remain in kodiak.dtsi, like the clocks
>> and power-domains for the LPASS RX/TX/WSA/VA macros.
>>=20
>> Move them to sc7280-chrome-common.dtsi and put Elite (q6afecc)
>> equivalents in its place. The qcs6490-audioreach.dtsi file can also drop
>> deletion of power-domains properties then.
>>=20
>> This follows previous commits moving Chrome-specific configuration to
>> the correct file, leaving kodiak.dtsi for Elite and
>> qcs6490-audioreach.dtsi for AudioReach.
>>=20
>> No functional change intended. The clock-output-names property will now
>> exist for both Chrome and AudioReach devices but this shouldn't have any
>> relevant effect. And WSA macro clocks weren't added to Chrome because I
>> don't believe this would've ever worked given it already referenced
>> q6afecc and the nodes were originally added during AudioReach bringup.
>
> I think it's better to keep them, if only to make sure that the result
> of dtx_diff isn't outside the expectation of a commit that claims to
> only reshuffle data for these platforms

I documented this in the commit message for this purpose.

But I'd argue not putting (likely incorrect) wsa_macro overrides there
is the better thing to do. Probably somebody should've taken care of the
Chrome platforms when adding the wsa nodes in the first place.

>
> It looks OK as-is for Elite and Audioreach platforms (for the record, I
> checked rb3gen2 and FP5)

Thanks!

Regards
Luca
