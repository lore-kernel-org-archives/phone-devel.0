Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511993C6A58
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419970; cv=none; b=CJ3+TDgZ6pYUxKXOhUW5JoB1ZLGrmofHDN1fAtZBUhxgdiSlKSn7SQowABpmJ7e7/hZHEMajRu9ao21AfaP5T9/IP2CgqtjQZ5jNiudKyVUsI5LExcboYYhp/hSYykkC2zU0vbNJOZsRDKaHjQTReNBJLrJOgenlNjXkS4A1u10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419970; c=relaxed/simple;
	bh=Qj7u7fKzT27EaALLTcCusFhJ7ATg3tivF3VhphoT12w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OdEId/NhgV/9ymzgXjNcNzwofsxoo6mQjKEy0CsV/Qixk8PXqF5BO9JXkYoy09/A4pXlTlIZBNiyUcNlPYSqVS9b/vIwckeMCaDjmfdW2Adh8GK04li/63lJ9VAjBdqsykaWEKYh+hp76jIUVxlp+dE4+GqISO+x5iWDLioXh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaOVbzC/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaOVbzC/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso2476425f8f.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773419967; x=1774024767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpEPoHYvhvWkjpmYEpEt8jyUUg5KMMUdOdkwivHgCi4=;
        b=DaOVbzC/MQfQZvuTtUCqVq+ekt2HGjagyRzoDSez1ksKifQOvRzQStVjVt9jt6Tk1U
         bdBBx7iFu+Thpx2NA5bGj5w4oU2nSMWaMhs1e+yzddQ40wbImoyTSxT9YNWXqz2nGXF1
         fJGv6Wi+pBDosr6/RJ9WsaUHYrTNFxPEZrf0Vyoj3BecjhBXDFdJB6EKonccmftX+p2G
         ytwkEaYR5PhUrH6LqGqaGr21cdzhSJLjy+PUBsBL3PvHrLTEdYVg/CDKmEWhF5A5u/pI
         kIRZzLDTXyWvezW8Hb9o6r1Xn5WhFR3iOukr3yBTel4EZjUG7QA2ttSMYBW/QT6+II0/
         Tq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773419967; x=1774024767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpEPoHYvhvWkjpmYEpEt8jyUUg5KMMUdOdkwivHgCi4=;
        b=sQ/lmXek+v+VbSHwVzWr4Rb/W2Dfwbk5uUNZ8SrbpPGsEkOIXgXrj61HLJpbJeKwgt
         LOT+Ax761jZ9x1WYBNY+6ZQasYzbuSIWEVXlBA3k9uKl73gCbZLXgfPfkGz/2aMyI/nP
         dro2R2yDAnLip9roK+T1LutfakUS8bPHV/ALWWMiZqNBIl8x9feyl2/5MGY7MhkHJLG+
         xcQvbcvDMi4YSlecrqouJjnTet5f7gjMeWbSTAUCXDlNikZTczqUb4/LiI359v+7p7gK
         A9QL8EwFtgE+SPz1Km4Juj+j537yDLAIr0cqPmOhwif9N4b7VMIrvtvm6yi6HHAHxi0Y
         G0Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWCg1xs60HPmGXOWw1WmwVq3rF3CEcz4Vw4zExh2h+X7iQg3u6bd59iWRWtJnHOkIKsYFsMG7VEizrBnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyacxde2Y9/qyWxL3en3Wk5brUna8iBZ9zDrmnoeig5AnoEw71
	2JlqwAlA3DdUXtagh6BVXQVnr3aMeO30N6Az6k7mzeVJhNoXpxKpSIGZ
X-Gm-Gg: ATEYQzzhDjXTuMomBfqAt5db9y0Y6gIRstRR9C2+CBZ1pZPkccG5E+gKvGqLmQgfSOC
	Apj/O8ZQlFlJ4I867qYxtKiPNtwa4M2/jABsyPWyb1RhhxyOv7F18R0jfunWLN84InJihkd5H0D
	ckDSjNjYoStEtRfa9IfyjrV+0pTsxyYwlBh7zClhHgI/q0jt6ph8yU/RF8kTAY3I13XWTTL0+Im
	bssjPlp4Wcx/ErPYITEFhEysfLKRXpOw6mPmFtHr+YjaALo9UsrW+T3jnm03mPMu/k4Fgw+4hlq
	KTsch8jtaM4IXoqlppJeniINO40bZ5l3WMGtqqMKv2zrFJ8q6j4JFSo/qdd9nwfmzQoMcv4OBs0
	fqnHWkwnA1gBzYcWH5BJfPXIuoqIbhZ46UmfZZ87sGESr3bxdzUFAeQS6p4d7fQPAmxdpOZp0mx
	ueqD0P/oahmZlBjy0GDDA6xQ1D/f1Qia/yicz8
X-Received: by 2002:a05:6000:2283:b0:439:cb79:ab05 with SMTP id ffacd0b85a97d-43a04db5ff4mr7600661f8f.36.1773419967340;
        Fri, 13 Mar 2026 09:39:27 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22e9ddsm16346345f8f.37.2026.03.13.09.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 09:39:27 -0700 (PDT)
Message-ID: <3d27945a-639d-4c3d-969f-2ec23bdd9900@gmail.com>
Date: Fri, 13 Mar 2026 18:39:25 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: light: vcnl4000: add regulators
To: Conor Dooley <conor@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260312-vcnl4000-regulators-v2-0-2bdebbcbb58a@gmail.com>
 <20260312-vcnl4000-regulators-v2-1-2bdebbcbb58a@gmail.com>
 <20260312-slouching-shelf-c8f64433881d@spud>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <20260312-slouching-shelf-c8f64433881d@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/12/26 7:39 PM, Conor Dooley wrote:
> On Thu, Mar 12, 2026 at 01:53:12PM +0200, Erikas Bitovtas wrote:
>> This commit adds regulator properties for vcnl4000 ambient light and
>> proximity sensors.
> 
> This we can see. Your commit message should say why.
> 
> Do all devices in the binding have all of these supplies?
> 

If we look at the datasheet for vcnl4040,
https://www.vishay.com/docs/84274/vcnl4040.pdf, in figure 11 we can see
that there can be 3 supplies: sensor supply Vdd (vdd), I2C supply for
the bus Vpull_up (vddio) and IR LED anode Vdd_led (vled).
The other datasheets refer to three supplies as well - one for the
sensor, one for anode and one for the bus:
https://www.vishay.com/docs/83372/vcnl4000.pdf
https://www.vishay.com/docs/84138/designingvcnl4010.pdf
https://www.vishay.com/docs/84327/designingvcnl4200.pdf

>>
>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>> ---
>>  Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> index 2ba4d5de4ec4..a1b4c02db246 100644
>> --- a/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> +++ b/Documentation/devicetree/bindings/iio/light/vishay,vcnl4000.yaml
>> @@ -33,6 +33,10 @@ properties:
>>    interrupts:
>>      maxItems: 1
>>  
>> +  vdd-supply: true
>> +  vddio-supply: true
>> +  vled-supply: true
>> +
>>    reg:
>>      maxItems: 1
>>  
>> @@ -54,6 +58,9 @@ examples:
>>              compatible = "vishay,vcnl4200";
>>              reg = <0x51>;
>>              proximity-near-level = <220>;
>> +            vdd-supply = <&reg_vdd>;
>> +            vddio-supply = <&reg_vddio>;
>> +            vled-supply = <&reg_vled>;
>>          };
>>      };
>>  ...
>>
>> -- 
>> 2.53.0
>>

