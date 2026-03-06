Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B17837C106
	for <phone-devel@vger.kernel.org>; Fri,  6 Mar 2026 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793434; cv=none; b=ZmsAxSglLsbLHdf5apHZOOysTwhkMCsbo5ygbrNJ7VdHJP0bJEmcBof5bT44W8NzW3pA2IRebIKXiDjaZ4aLM8lAwzzs1yI7eUdkr7bDf23I9xL1qidbR++mLnRcXXHs5SaAjOFfWtAUQPYT2evjC+aA35p/ley8ArlZGh3mD0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793434; c=relaxed/simple;
	bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=aw3j35qiMSroQl9ZxH0iSw44bZYcli5wt8xWoMH9joHAVC1wHSRcCMVt7qeon2W5jtLTiseUoAfX4tM+qx5vFnWJ6bTbxm9dIgI8/AwqJRmBSrEkv0uttX2K/K/zN0way7ihno/heL28CO1Z8kpXcA0+fv2CFeKIBZSxFN31nqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IIPRPf/V; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IIPRPf/V"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b941762394aso165303166b.1
        for <phone-devel@vger.kernel.org>; Fri, 06 Mar 2026 02:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772793429; x=1773398229; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
        b=IIPRPf/VjAEUXK8IyQI6dB7AJahg7RWN0BIknY7cs1Al2aaH1qimHs6i7pawIGUrqX
         aBc1Nslf7Kg9oY+W2vanwvTGk3ltaRcuCiCopK8wVNr8zNYLxxk4meZJPXmk9utElSw8
         F41of/pPfqErHw2h00WlD4cOll990+Tze/4WHyv7MeabOpmirywwPV/uhtInqJkH0CFa
         AOqTCp4ibA+NSsget7w2J3A683K91Rnzv9I5FxK9jwggUTGeUo8/lyxTzPUluFcavX+g
         YuamSImqSprJnKZTqCh2xY094YPt5lgYF0eI498QHjdNiqLKSMboazlBT/PPI8hVjVbo
         44Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772793429; x=1773398229;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mQW205gegUibeTid/1e5hyvVPikyOjbbJTshSUvqqE=;
        b=waVhxeYCdfruTPXhmalsWWPZ+pcbMB7rw0Sfs3+I18MJQ2/pJ/Jt4kQYwTlKqEy61r
         h8eHAfam1upNaVXlRNWAqH3Hw1QS26IttPD6pn2n8Wraw6JYlBjzeFNWWyo/t6CCE94G
         WocbnJPZkfj4RNjluRJd46+37wCkY+kb8wsar4QamaehcZ4Dihrp+BCI4aTQUSpywAOk
         HCXHLouwwoUQfHimNu1QmFJxHRX5u4GYb7PaD4SQIO30WdvvJRn50vo0iqWTKoDDzm0j
         dMbQ3Derm6iomuy3tDHpVxBZ46jjTUx/itmVlAYLiF6uIb3WRD5Ev+WYBWljC8WkZglW
         a+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWThRIWNRV86oqna26+CkwTzX+1xbAxYxOxhiSnn9N935AlzPwVdYDoIb9WEqwwdCLRSp+siMxCFEU9mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XQtTb7kVuuIP6YbWmG9cutdBuxagWyFIhIwvIfR9Ti2qOAwi
	sRhyXW/2npl6Au9xx4FwMh1v5nQe0Jc06ebHLR1OcZ+n/zw5NM3wBu+sZ4oqxbPGrhE=
X-Gm-Gg: ATEYQzzlQPOT2Y9sOSYbLxsmCQgJjITw/UztRTrc1Belo3N0frQvLHE+h0JKVsEvYwN
	p3O/irU772yZbBSEP+r9hG4H5a933EgQcWuX0V8Ua6NTRcCjmzh9t1luoTK9Cyvy6MK0lfsk6n0
	PxyGWw2la+jNIdobKsPze6TTsErz/3f0BXHDRVAhkh4btaeOGWsX1vAUzv/XHQJu0RA2ged8VOZ
	rctbh8GJ8D8gpmfeXU5LKB2d9ZhFNFAZD5b1hKWMaAABxQtlHMTifwn1cNzfMznMD7DoG7PIhyo
	FxjWdxr17GNuOYWoJlyrWJGj1ZHUL5e32hBYYBBzFX8chLWW7vzMJ0sMuir4YYYAbBg1AdBytsO
	RmNlntpJIQUs1Ae3eu8zhhj0yF3m4Ig6fABAeWQUOy0QpuOsG4kiNHRfXxyPcv/oEP4URr5LJR/
	FSucn4VbRQCp1YvDt4STA95ta0AREy+e0LuhLmwCe0GVf6TsdKzhihq8tq8dEOI1rdCvru
X-Received: by 2002:a17:907:9486:b0:b73:572d:3b07 with SMTP id a640c23a62f3a-b942dfb4369mr108342766b.28.1772793429277;
        Fri, 06 Mar 2026 02:37:09 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef8ad0fsm46007966b.19.2026.03.06.02.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 02:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 11:37:08 +0100
Message-Id: <DGVMTLXR7VVA.3UCTHBGDDIKL7@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>, "Taniya Das"
 <taniya.das@oss.qualcomm.com>
Cc: "Georgi Djakov" <djakov@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
In-Reply-To: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>

Hi Taniya,

On Mon Jan 19, 2026 at 11:28 AM CET, Konrad Dybcio wrote:
> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
>> On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>>> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>>>> Document an interconnect path for camcc that's required to enable
>>>> the CAMSS_TOP_GDSC power domain.
>>>
>>> I find it confusing. Enabling GDSC power domains is done via power
>>> domains, not via interconnects. Do not represent power domains as
>>> interconnects, it's something completely different.
>>=20
>> The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
>>=20
>> For the power domain to successfully turn on, the MNoC needs to be
>> turned on (empirical evidence). The way to do it is to request a
>> nonzero vote on this interconnect path
>>=20
>> (presumably because the GDSC or its invisible providers require
>> something connected over that bus to carry out their enable sequences).

Do you have any details you can share for this discussion?

Regards
Luca
