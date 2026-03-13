Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E7430CD92
	for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773410466; cv=none; b=CXfMM9Dc+Ch+9OC67hxzkYdDpUVHAw529dR8OqraDtGTOcAta49h0vRto6k2Ahxy/XJPfvu1mLmGjWfn+sU7yU9v50iro0G2S2u/GhKk3AHAktKkIR1Y63LpTwq4gSnWMAjzmDvtbKlBWePzmVKiIBUOgGuf14GG/gW6ca6b4oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773410466; c=relaxed/simple;
	bh=X2YXoo5oelC/yO2ZVmRm/ASMJDAS7BiQnBAfPRY5clk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Td/I3O/3nQ4yih81pgJ8a2IOz4Dr6bCZXjS24LlnfD5NTDh53w2jmLVA2CefC8SaFI8yffD95U0DSRMtGTiyL7djCVGq5JHb9/uwWwW/Q83xaJeiKHvOp5gbK74x2bWGuEjUgI+rcXLfWa39s/noEWX00FW0q6VQeD20APweSVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FSGfmcBH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FSGfmcBH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b976536806cso157657066b.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Mar 2026 07:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773410462; x=1774015262; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhAra/BMCH0n/XOw/db/nSkVgG1PExpVOvX16LQ7Y04=;
        b=FSGfmcBHqRtqrE7Fk18MOZx9o3FRpU7JxXWfxQoDokwxTzBwpFV3FACYRbxijp1lHw
         HN1u8NCEBF0A+6KUT8hTJyYkr8enWR0xf3gJv+8OzxPe4ZL1TehJPSBzE//uzzFayQwv
         vc97UoXGtsd0Qopxc0vbApSx1leL9jfuve5DF9f8x2hAfxsxe58HpHV6r7JYLhXPcRif
         WHy03mKAG3t4wk40TJa+2ifSq1Hup2QDLRlXHiJhzsFipldhnahEKpTwLHU1N/Tpw5cd
         MlN01FhH23d4OHBNdDbheLyt7EKMpNo9ZSzhRUYfXo05JqoAbYYA8Ei92lbgeVdToMQ0
         uJ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773410462; x=1774015262;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EhAra/BMCH0n/XOw/db/nSkVgG1PExpVOvX16LQ7Y04=;
        b=GCNrcWdksagL7P+JMdR3rTWiscxVZqybezd5wuStL8AtWdOLgdGwbVQyU7QJ6n4uAY
         Y4ndmmpIazIC404aZb4I5C3t7secHISuW/dNx10dgyaVYxAc+O8Go4pk6xBppNKvorrt
         byFYF3JoLo36aGwstsayelUprh24Byk7kI5YR6w6APSMT9N2b6WGPYac7g8PZ2NwdIWe
         rJwTgtQg9W3w5ZTldRRK+b+2PnrhjdQNaYFU6pTBhkfamqWRxftSRlZFDZ3oqqEH5h8T
         qHId/Aa8xGCEgcNyQrxAPg9Z+/XtSIK8iEbteNpvqbFB/xW8SmJyZEBTeqP9+rucNqBm
         W+nA==
X-Forwarded-Encrypted: i=1; AJvYcCWTb6dl6+K9khR2cHPbhHNsOL5tC5zYPCqUDZlU5z1QX9d4oBC5i7ifEo1lQD9T/4PYeXYbvmxluDML9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVVo+Y94OElrfRFhh3EhNpNm50s0bY2152ek6PohvJkhvYyqgP
	WGoBUArCGpzX9NGjFr572tSBq/36BjS91rnI3+5RsHUgah1OKnYQyKRmbgI/qvFIn2Q=
X-Gm-Gg: ATEYQzzzeHJ0uw5tL1EyzPt4RIgqr+12x7iVwI6eMZ7XhbYHiDLasSUpEATxlyN4vQ3
	TfP7yS7NFgMnSoOR1YzV6QkCgY7IJVOYbwUunfwvyLUDAPSbczh//FHAamksM6BhhouVgY7noT9
	Z9A8hJ3PnE/8gN+rVCYTdeSo3dxW/VrrQPnt1Nva2KORspYqXN/427k7qcyUErsBq6LLWmlDWBb
	UgqdzcpZ8C0Vn7xTToJDVUhJeJh0M2GwVqTZZ/ApqcRDuxodSoM4bErR+5sJuaWKh1B3pjwXT4r
	zJg9jnkFIgXSE/OgjECUpNz6t6/bIOeD0Y1pAHOwExO6CpRi76pmsgxAAIXGo+R5mxQ1NiqdNfS
	mgg3z18L1cx6TI45QsxO75J89d+gusdzV25e0oADpmuXR6KLJjoGt1kd6NAeCgv4sg82BpGzTOu
	bcpxlWzDiL2kl8xOY/wcc4ay9eYWiCU6JDdmtFxNhVAXwZ54WM37nMHBV21JkzHURHL4IV
X-Received: by 2002:a17:907:7421:b0:b8e:d4ed:5eab with SMTP id a640c23a62f3a-b976534655emr128493966b.31.1773410462146;
        Fri, 13 Mar 2026 07:01:02 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cba2e01sm48940266b.9.2026.03.13.07.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 07:00:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 15:00:53 +0100
Message-Id: <DH1PJFGWESQU.1OEKLN0CX3IZE@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Alexander Koskovich" <AKoskovich@pm.me>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
 <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
 <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>
In-Reply-To: <DH1L9UD68SKL.21KTH1XGR724Y@fairphone.com>

On Fri Mar 13, 2026 at 11:40 AM CET, Luca Weiss wrote:
> On Wed Jan 21, 2026 at 12:52 PM CET, Konrad Dybcio wrote:
>> On 1/16/26 3:50 PM, Luca Weiss wrote:
>>> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
>>> parts.
>>>=20
>>> Thanks to Alexander Koskovich for helping with the bringup, adding
>>> 'clocks' to the PMU node to make Bluetooth work.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++=
++++++++
>>>  1 file changed, 174 insertions(+)
>>>=20
>>> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/ar=
m64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> index 52895dd9e4fa..cbe1507b0aaa 100644
>>> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
>>> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts

<snip>

>>> +	bluetooth_enable_default: bluetooth-enable-default-state {
>>> +		pins =3D "gpio53";
>>> +		function =3D "gpio";
>>> +		output-low;
>>> +		bias-disable;
>>> +	};
>>
>> Not sure if we need to drive that pin.. perhaps a pull-down would
>> suffice?
>
> I'll give it a shot, this pinctrl is coming from downstream but perhaps
> the downstream btpower.c driver is differing in behavior to the upstream
> PMU driver.

Seems to work, but honestly I'm not sure what the actual effects of this
change are?

-               output-low;
-               bias-disable;
+               bias-pull-down;

Regards
Luca
