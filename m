Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD3B32AAB3
	for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882544; cv=none; b=dh8WzkssS95fd68W94fm5rmtVWsq7eYpBwZb7iijv5eTguXcJ1PALiAm/pmy6qWmbsbFFL3r/8HCOphV9ksGHsF/4dndMP506T29mKhp51xgibDeT4DjLgl7jO/iEJrfwtugTRmQL9YDg+1kfUuyEjF9eTEK3obBwIm85yVz+Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882544; c=relaxed/simple;
	bh=ALD3uDNicTlrTjfpZN84frj9IWM1PUG20b/GPPZcjkw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=E1nefVk3tBNntorAi1P++pokKhBRVAm8J+dUYaaAdKO6iEjJDXV7v5Dnq6YwtUGWzyZ6RdpfGc/s4yPEZoT2PaDy+VlgvbTLbZ5aU5ror/b4SoQ77YZ2eO+31v9v6JfRBUSK9/xCzxmONqBY+6wQVDAAWCRZItl+768aJJVOA5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=D0xGysUO; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="D0xGysUO"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b9961e4f71bso693688166b.3
        for <phone-devel@vger.kernel.org>; Mon, 30 Mar 2026 07:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774882541; x=1775487341; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=469O081Aaa7aoFYWvcsfiJCJp8arQcJSe+eDYXLPnyA=;
        b=D0xGysUO4tD9ilbCGSWDFxnbQ1YttanWFBZtidn+/fV6kkOfmpuTCaqgcStYnN/A2f
         1rV0HvtQDwqgger5BwCPl1z0/A5QiF8mpqOwHvVM26IKlxdEWlHrq2QsyUjSm3XreuWJ
         7m0vMn+w8eBNjZJv78Tvn1CWzBi9yrdl1xaI7McMKv1iivjDm98W4GZQE4sSLNoQd2as
         ddYUeuhvPl/Qn/SsN8lKz6FqtyQ5j9YzybZeMG8R6MAv3AVgxAu7gONb+I5chp7MjUqy
         wKaNgfYHJP2dE8xptw+CggpzCmROvoQgM/VbSsYCIo/D2/bknx4Tp30Br4NK0qz4vE1B
         FeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774882541; x=1775487341;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=469O081Aaa7aoFYWvcsfiJCJp8arQcJSe+eDYXLPnyA=;
        b=JJFjMyFLdRxQCg82vc4ZJ/ugDip6a9p66OUb4fZsObCLKXmMsZqOjt20e1QgTLN0ba
         IxhUAyTs8T/f3mC2GZEIl8Vm2e1jOpAXZQW8HGsSXL5HUo74szgH/OvTkl1kW1ixQaRb
         HTRVwzqRuwYaumpuYVYYovR3f1cyuLe+83tHKGfywvfW/ywfGlYjbh2vLw5dsucnSqP4
         3LoTFFGaQDV/e8DD7TjlaFYvzlC9WMXYT9QIdG5+kaTqT+WqL2UjxpZK6q/Ms4lAb1Qr
         GzRsIRiJpqMMcg8qQqC0IfGK2LrAwmu3IoGwnLhcnZkBYxS6ncB2d6iujfT8qLCBBXPy
         MwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNVAaQIY5gxAiBXMK4Ncnt728yywiIq+g57IIpKwAIMN0DP+sRzrAII3W2EWS83IaKjUC+63eMWT7Sdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVW/2th9jyWH6H//7HGihFP3EZMakSkPFtX4FDWgQKEQC17wJ
	xCgYD1zsTNqpDveHMdEdxOcK5nYCbvnnZrzj5qeHatUsgZylILibByBWGQHdTfk0gZM=
X-Gm-Gg: ATEYQzzc3+Q9aM8mpWF1bCxVdCTvUxpFYv+SN0Lh63XSsXJXVJHjy5NrhkDL4wuzdBw
	jRescM956RJp5ldSQYREbmugRUL1WW8kvnSTTM53z39fFcUcy2Ao52rQ22l+UiY3QuKmdiW4CUd
	jwfObP78ikgJKo30sVE1qB0B1ofgTOpzfiJiBFihVEiMAqGtrGHoXukqYzQvitq2ee3nAs01FEm
	4HI9O+wHuDqX3VSg7XMvSzxtvun0TN4G7FpWDVCN0Vo0mX174/njcvkSTfVMnznZkKR2mmzGBE+
	T7BBkIa0Bt1of2dm0f+7g0hgsHAsGKiMXpzK3nPwsLpQ4CzUr7vfB970hd4gRAWNSmBwBOzKSZp
	jeJsR1gVxlojTqoOqmMdROhSlU/EwybTsVStoob5l21qltpavVZxKJOsV4NepjqCs3qYtDtqep+
	kplGwL1hRl1ycMxxae8XstDuYvNVMp1n8CA5iAxQPYPlgTg1x9fSXGMto7jLkQT1s/ITQ9
X-Received: by 2002:a17:907:7a89:b0:b98:9da:4d94 with SMTP id a640c23a62f3a-b9b5095e40amr877735966b.48.1774882541028;
        Mon, 30 Mar 2026 07:55:41 -0700 (PDT)
Received: from localhost (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fbesm301940766b.37.2026.03.30.07.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 16:55:40 +0200
Message-Id: <DHG7CMLREKDF.2L5V5VQCEYDKH@fairphone.com>
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mike Tipton" <mike.tipton@oss.qualcomm.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Taniya Das" <taniya.das@oss.qualcomm.com>,
 "Georgi Djakov" <djakov@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
 <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
In-Reply-To: <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>

Hi Mike,

On Tue Mar 24, 2026 at 3:48 AM CET, Mike Tipton wrote:
> On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
>>=20
>>=20
>> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
>> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
>> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
>> >>> Document an interconnect path for camcc that's required to enable
>> >>> the CAMSS_TOP_GDSC power domain.
>> >>
>> >> I find it confusing. Enabling GDSC power domains is done via power
>> >> domains, not via interconnects. Do not represent power domains as
>> >> interconnects, it's something completely different.
>> >=20
>> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
>> >=20
>> > For the power domain to successfully turn on, the MNoC needs to be
>> > turned on (empirical evidence). The way to do it is to request a
>> > nonzero vote on this interconnect path
>> >=20
>> > (presumably because the GDSC or its invisible providers require
>> > something connected over that bus to carry out their enable sequences)=
.
>
> The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
> It should turn on just fine without it. There *is* a dependency between
> CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.

I can personally just write from practical experience, as Qualcomm
doesn't share any relevant documentation with OEMs.

Without this patch the GDSC refuses to turn on.

[  291.055839] ------------[ cut here ]------------
[  291.055860] cam_cc_camss_top_gdsc status stuck at 'off'
[  291.055878] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x=
138/0x144, CPU#4: hexdump/1995

With the patch it turns on just fine, no issues seen.

As Konrad has written, originally I didn't see any issue because that
interconnect was being kept alive by simple-framebuffer where I've added
'interconnects' to keep the framebuffer alive. However when testing
without this, the GDSC would refuse to turn on, which led me to this
patch series.

Additionally you can see in downstream devicetree you can also see an
interconnect defined for the "cam_cc_camss_top_gdsc" node:

https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qc=
om/proprietary/devicetree/+/refs/heads/odm/rc/target/15/fp6/fps_overlay/vol=
cano.dtsi#2943

Regards
Luca
