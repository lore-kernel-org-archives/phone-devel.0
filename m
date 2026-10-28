Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189061;
	b=viRZq2WVk3v6rKroSUr2PqsUEwJypCkXt15KfYGM2LlIvrmrQzgzoJB/UGKopVzRoCPA
	 oTT+E5xBhyeC91UgW92bRvbREb/X6vYKWfoOVJzXkIfvrLRzxAvwUlx5icDiyPaKjhzM3
	 zh8QlJUOV5wgybjG2Pj/B476VXFPqUvTX1rOCTBG4QyMpzxWh9N28j+Q21uEHzhznf5YB
	 aqIk1VPo5lCFV2+U4iSsiP/5VQ3wcvQMVkg2yJMdizGZEQ8VQgzC98l59jUiadf2ckClS
	 MQbAIbIiQ8PeOuTLnjpGVyB1h8H8nV9gfcd6n2iVjSmSEOGNMqsZwtMQkzNOIONo1pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
	b=MWo1Ua1tROx8CNKj/y+pImN6DAcObrUWKebltxhku0O3FHaaokg9IJpAuG2hnzQ0mB4V
	 OC0GH6Urmn7+biT3A4F45N8JDKxtGSDJRIVlaIwazfVpzLpgT/iZ4foiWVVEW5Ootinqs
	 GyKSkXXh0aps8MVczr5KAsWqBdwQpg3U5A/jE7XfuHUWUZbPvtNzy12k9EtXSdt+3vgGX
	 C4ljNj6N/l8/ueis5DOngpl9brMTeOQBT4K9LEULDYPplpCnvvrpiaKDqLsC5X3w2R0+0
	 ZWj7ZCitaq8+yztdzNSwanmmnu6boR1QnyqeqDHd+u4Q49gtW1LrA+L4RLEEPnHOdJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90AB606A31D
	for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B90AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A6snvN9m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5mJLCG7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeBss1606951
	for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=; b=A6snvN9mZVyi5Hr3
	iK+WpdiaTKaqYIz/umvVihpeIn6IgxYYRXTNYoKJT2BttvtFDgx8ecfaZyaa6Zue
	BFx1aULCEFAebWHWU5MWzEdhgyEEAax/fldQaIPi6dSEzwAbWfA0h8argoJf1Ywu
	47PsPHFnaiICKAjyrXrFhaggHHfvTL6eRUloYxZ1d2HjBG2XisYZ7QyvzjmRDdfV
	49+hDLPcoLHvqH0bjAbrXEY1+pNrIC9rMHUtVPXL82+SoYI6KDfHwUTLncUsZMy3
	SKe8jms6Rhvipxw5RTYHwkKd8I5t2wekF1V+QxPZsSY38hFxfK+B0ZCMZYfdA3Oi
	0hEzXQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7j245-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:19 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eb86091358so35728e0c.0
        for <phone-devel@vger.kernel.org>; Wed, 28 Oct 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793189059; x=1793793859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=H5mJLCG7NgK9TgtT2xYPSGhmEEu6TtQWhXoTXS0hHL6lGk13A07MStjbUB3OQzRJgS
         SPcKp1VYBg0rc4Zud4a7HGoBgzJSVoOf3FNc1V/ftd7WRaEUXSbt6TvbjFwq6iBGEApW
         +P+mS3knShJRamEt3DHDPh9c2n7VVA5q6sskO/pEvjztEepyJtF2+uiEY5stWsMi9J3E
         PgcQ/7uFg9elf3As2bURA6Vs3mEy93ljMJydYfOXmXbcw4yNx4mmeiIdcHR6CadsVL/z
         xhKze9ofZLYuuSt7nm6LHJsBEHDEBQijgXtZGn7TZDxrCS/3d8IpfYB4SOgvJE5c+B2D
         b9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793189059; x=1793793859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghp50T07BN+pBS1mt66586n1LUvrkgrvsClQgUfUovE=;
        b=yP4NDVN0/ZJ7jzXf5kZlHW4F+soGQsBFlg5v0HZkoAVxSMaEsZkFWVR9izSZS968Uq
         Suu9YOO92G17S4HjkjNRNLPxH8DHAAYugygg0JwOKmuchGpZ/T69hu5QxG+xrbjwkqEJ
         PXPTHoC+B2oZeH5tQOzNoBI9zo74Oa9Ui6n4pwtXxdNVM5yZ3pPHIbSJ4wzlvkn70J+F
         5yxILK6vAofoa2s8o2H6teDKn9C4+/0e/UaU/603PCnSoDuDmK24fIhoFnjIyPCXMJnu
         2KpQ8k0+vd0LBMlCB5Yn7Egs4nBmjLZoRKWXMbrKM7dTkgHuCfpMAaOwR1bn8oViu4Xj
         j6Fg==
X-Forwarded-Encrypted: i=1; AKwUvBy2crPo8QHZpB3TQ4RrEeJZFISewCtDxwhFKwzKxYmfYc4+fCDaBAA8DW55i/U1izREDHHqj8h6+pG0oQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI9LWAvgtrNTe4yDT7Y3v2gwmjhHRKgjYngriMnA6CJ+92PLecl
	MWqfYuQjR5P8fvCIWTs/obAAKeab9Y/abY6Pdko8jruXzo3+FjAuKLFi8XlHdJ3gnatQ0c0XA8i
	VTwaJ+6wKJ5607nL3XsPX9yyx3yjPaUUhc7YIuTsNsQkJ9PLvBiczcJLZtpTJ6+ekVg==
X-Gm-Gg: AYBFou0dElc/Xt968o79hwsaFPmiDxxZUKJJLXtqFlE4EHGFCG/ozlfUTzAb2dX+1oc
	61oKaSbE7EscE2+VlUsHhk9AHUv/wyLw+p3cdKFPysL5CugBt7JSsCaQwxMuMTYNIpcYz92TONq
	2IaJhWfrR304HkZcfkkW9b6FLK97eXc1FcJ2wfyayMqGnU7ctk1zUPBsYrZ14d+T+kheIC2fIr5
	aLt7SWQlfW1ugA7gJ+D3D4ehj72ywGeupuAodXvM57nKCBZL+abgv6DyGwu2EzPGlGOjNDCuof2
	XNMCwEulBBzlxR92fCf7HUTlj5l3N/IFtvX7ffYSOP/GMy9OQcmATw8fEFKqgCrw1RbLipVo2Wm
	kw2afgwOK5W52NeygifupD929N+nKtkJd1eV5Ql/pXG3mqiEqPJ4/1LiXHy40XZUJcRJ31Ew=
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577558137.3.1793189058736;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
X-Received: by 2002:a05:6102:8482:10b0:7cc:22a0:de89 with SMTP id ada2fe7eead31-7d03a556ca3mr577514137.3.1793189058217;
        Wed, 28 Oct 2026 05:04:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm1348803a12.19.2026.10.28.05.04.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:04:17 -0700 (PDT)
Message-ID: <96405224-72e6-4786-b13e-d73134b58ca2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:04:14 +0100
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7325-motorola-dubai: Add vibrator
 support
To: Krzysztof Kozlowski <krzk@kernel.org>, Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Enrico Cic <enrico@privacyrequired.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <cover.1793135056.git.soyer@irl.hu>
 <8717c3739be282747cbef611d242acfc5a40656b.1793135056.git.soyer@irl.hu>
 <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028-thick-gainful-pegasus-e1b430@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6OTfisXpySi6
 cG0nPZnmscEMk0m0hdE/OqEFZRRzyalKg7K7umQvt8NETiUpt6+MaQ6bCYsOP2NjQg57cMgTLQM
 6vO/juR8Yor0k6Ws6c2Ifb+TfEc6Myk=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae1e4c3 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=SrNx-AKsgThqvEfA3AIA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 3Ffr54utcsEeWY_uelJx0BCsYqTm7OcK
X-Proofpoint-ORIG-GUID: 3Ffr54utcsEeWY_uelJx0BCsYqTm7OcK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfXyqy5lWgh0P8E
 4y9jfAE0POAjmfKQOu7/qPJqFxZv209DqZAHxLyvKaVZJS7uF5fje9lXYzs3mlkUkEYe663ZXCN
 /VdkoE1xHddyOR47l0IF36mne5GcUqKa1EnXnJx+hbraBfg+blNgr555oMimfUEwSbnat8yt1rT
 OZSWpfbeo6h6zwTJEpIIPfzUH/zqnQcb4pWPYgipoTkYeTP7xvo3+/LS9tUnmz+29athYkO81nV
 6qhuAMwEjnmXAJPiYK6qK2h5kErkMwnVeBUMuDHLvPeoaPv4RJXKyO3WBGkckVHWa2CpAYiHr82
 HNT3ufYQ6iB6TglK44ZBdJECDoXChqE3rbavp2RYgrDN4/d7VIU1NyGGB9/TGjFhy1q3Bq1PAKy
 G0bHi61WiUq2IRYMYSKmvSCt4lnyfxbu/rZOiujJsLiQ//N04gJfZN15k8tInk1HulffRulje9p
 c5nkQ/vKraEBw7Vz10g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047

On 10/28/26 12:08 PM, Krzysztof Kozlowski wrote:
> On Tue, Oct 27, 2026 at 11:01:25PM +0100, Gergo Koteles wrote:
>> Add the required node for haptic playback (Awinic AW86224).
>>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>  .../boot/dts/qcom/sm7325-motorola-dubai-common.dtsi   | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> index ef91986a1fb9..434846be51d9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai-common.dtsi
>> @@ -924,6 +924,17 @@ &i2c4 {
>>  
>>  	status = "okay";
>>  
>> +	vibrator@58 {
>> +		compatible = "awinic,aw86224";
>> +		reg = <0x58>;
>> +
>> +		interrupts-extended = <&tlmm 47 IRQ_TYPE_EDGE_FALLING>;
>> +		reset-gpios = <&tlmm 46 GPIO_ACTIVE_LOW>;
>> +
>> +		pinctrl-0 = <&aw86224_int_default>;
>> +		pinctrl-names = "default";
>> +	};
>> +
>>  	wl2864c@29 {
> 
> There is no such code.
> 
> Please work on mainline, not some fork.

+ please keep the entries sorted

Konrad
