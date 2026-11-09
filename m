Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236238;
	b=3F4IixVB6rhJmRrAQOwP0gXnIDs90vNwufVAYH3eRkjVp5AYkR9lLZ0IpEgn/RJfz8JM
	 2t0FQFixodrk79VNO+tqmw6FdfgwTrvL7NBZQqaOvaa0WNODu5Vv3NuPZ6T5eBD3hMj+k
	 FY3VBl8QyJMccyjKZxzqa6JfA9+mI/yPxTopt7NVOpps06daFZU2j8mUH7Awyksicas62
	 YDQMYmMpxtWqjIc5FoBEdty6huOsA0OGF8svzL7wgmx1QKWFk3VEsVCnjkskja5FklA7j
	 e7Zr0KB5YnVwOqt/UoTratmcEv27xkaFzMrStzB4lXL74+JkXwHy9NF/IO3bu+vlDFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236238;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
	b=gFflxmG/pIxzgV1KCogI/xbwVJeNJxBuXgG8MHTb+id6t4BJ+YmualiD/QhRkw6JIigi
	 3FSqBmh5IkXwZkCnma2v/9vee5n+Wp2YrX1W7OGs1mThA71gg9eCgmVfak6oz2uIMKn5H
	 DeUeRuL0TeY9+tvvfBtPKvIrwsBtMLV9aO5GD9ffr5kkvwEQ1kslGhGo0obHhsHbWf2D0
	 YaqUDRo1ZP3fqpU/RZpk0lIGfdIMBjpdpIYodGgeWBnFzJaHV6lkEhSrnCt4cUasztnTA
	 bYP1sQmzFy/uS+z0UuMwMSjhxtjP4jF7mErT2+dW6p/TuUfq1n1bSra/a7vx8xXYOrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B55606A33D
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 14:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15B55606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFFSo971364
	for <phone-devel@vger.kernel.org>; Mon, 9 Nov 2026 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=; b=BFq8BqgOWHBy7rpY
	XytFy+kA7CtV9qJKCSEga+ah0ixp5++GUYK/Mw4xX4A6B7vTvjicuz1jHZ0Mwadd
	NvL7ttkZhTk9Z2ZtAu9LBI25Pft4BOzMZ+Ka44GAShWBXDDJqTpGFX9suhX5E5gG
	zd+oqa0khh4OtC9oyEhOq/i0JZbJDKDktcYzu35upbxiACBlDFxd6M8WrXGvIcxC
	RXl/fqlDEgZF3dIo+mAdgm7N5WtcbSOBg2Uw8uf4HKJv3t1reSSvWnO2QrU8uF4q
	tYK8rpMBE8ihUW5asCWoglo/6hzzrU+1VOANKRt6JWa4Y0alAXyMzwCl3C9QADxd
	li5v2Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3ng1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 14:57:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so22682185a.1
        for <phone-devel@vger.kernel.org>; Mon, 09 Nov 2026 06:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236236; x=1794841036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=DpR+dvKUW3JpQG5mLvQ1D9BxUA1zVmYGjI0vs/YntxA0L1Cme0fcVElNOyucUsO2kT
         DcAIJF78JCcmQKWIDKrgy9BF2K4tBJpC7dhUJ2qU7Ct03k0BvajPd9duUYHS8lpwXIqD
         lNpGjUbgLwjN8lcH05fz5Jp+Rsfm/Umd1MGwNm54ANmAaCzJz/di1sKve4DucAS550El
         bX1YLV3H2OonyowT7GbVKJWHrgSVIFON5Y+ZxXTWCswEtV+S9M+Pbx/XSp8ryGGV3ixR
         kbWDo0onJ7csX3UnCQ8ey0hz5alrS3FHG7pfdZ4OCwbaWMUrhTCD3bxO6tjmjQTwgbHy
         /FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236236; x=1794841036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=xPi3uxXSXTIutcak3yhgwHIOEzVUZpK+M9tzeAXZCu/LUR+g6GNh0EG1U4EMAQ8Bty
         xWRSjzpr6QKuEtW5e7ifLq/I8hUJuHTLnNSbMlDOxWwHI8LsdQ9lC6ILYDlXk+AzpqfP
         JB7O6ew+OZt/NkwshcWKwuCwcCyuiEE+Fz8vNPov77KRn+O/U/P8YvYO5liBnCo55FL2
         dH3IIHUVYnzCjJ5WbFi11FkrvQ8Qcy0VbVdE7ruIlDpbpfo51Xzcntjon3y6YmcQCqzO
         MrzTfoJucyGhNJ7r/VMl3LRPhuwllwElIkNDEMtaEV00e5Xg6vBou+mfcRV0Ei/uaOmm
         vSAg==
X-Forwarded-Encrypted: i=1; AL+hErExIz/vbDaK3k0iabG8fsY76osKOcwtT8UIV9DHwK+7ttjwHetFK6haXyL24LuDTGegyxl962NiLJzG0w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8JS4VUehN50zFOyRj5GbIoHXsSpgalBYai+91/J28DFURa0NFL
	ER1ys0ZSgdVV2zbB7wikswafFqFtz4dOA43jpoe1HxgPmL2jJlyotJj59kydwYP6TkOcpeMGRh7
	iQcAibqVRJ+Pdd+6IyplR9iqdEKk3l6pzWCHfKp6p3apdD8/If4ZoV9Eu8t2H1/5jLg==
X-Gm-Gg: AYBFou1h5C47lLXV6AbuS5eHIcsUoITuaqY5eHXfSnCI6zMcCHjkaHQd+JdE5aD8fRp
	hPB4mHNSmLQYwaiZfrlhYgXiFHYhrthI8g44Fgg4202gI5KIq40VYllPGSr535RDBkh8pmvBpP7
	RE6r+6BlC2R9ClNezWXWKBukCONKLM1HNW928dnqujOEYGyQFHzsMT20kbigAXCqt7q38533fXs
	tME9Yb91rk4tczyXOYbAx8k5ezfTxvP8I0k6HVnRjXr+oS3gqtGlPtwBXYmk1kOzfVV2IiXjWF5
	DC2aNeUNS2XH+iYUgoNgSPEKmYR9cTH39IDlLhFMikUGfwetz8raPUiJvWnHZybVEpB5ZAaZash
	vlfJHjLkIAR9IpDxwxZXKJNS9XDgHLo2DM9hRHC0a7skOuEWQWwPEsqvB24FTVg7LCX0WBg==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643351385a.6.1794236236299;
        Mon, 09 Nov 2026 06:57:16 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643346785a.6.1794236235768;
        Mon, 09 Nov 2026 06:57:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f943fasm178778066b.16.2026.11.09.06.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:57:14 -0800 (PST)
Message-ID: <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:57:12 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <mail@fhannenheim.net>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
 <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfXwQO0JTzeXOf7
 DsjgHmjmRrFyxTlkKw3LwYd19Y/vjnH5WjuA160I5MgmSKBZAS9a8V7Sr4LseoQZBXu6bEY7oEw
 eRzZ1KBGc9t5B+JW13YlYpDMyPqkMnA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX05yJLvV0aT67
 hCC18IDbq8iM9RjRRHTyldvCf0kSiRyLLJ3P2pxDGy3nodp984+miQtF0dYNL2O9lMGAsI4YMou
 gwkIRq5p6VO1LrWgkB7cEnzRSpFwJvHvEyzodeIXZkzvtgNn2SQn/XItLyXvX1IbCKpO+YuOF0H
 MO7q2DVhFose0kCeeUbaT5+dOSYvjAi17q7zYuM+hFLYwr9Ba2IgpXi5x1xzZPXYeKnyDm8vWM0
 hh5Bi85/jd1ffDL/CAq+HGAFvLr8pxNCe0K0wiDy8opMAMdeahC3E8GHk4x38epCBiaU7IRW0aI
 FBST0+EAeAWwqxWsjsYG9tdP8fbfb3Or7w6tKpH6d1ks7eFOKQxIEN+Y36XRnZ5+gwSQKVxdfjl
 MmwHyhxqNAskDmyVNZ1Tk+J89zge8VGYrGdk7LkbLlb5d1XtHx9qIwpv5E/z/VyNP83G48sjvOI
 zadoF4OpJtbfKvodE6w==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1df4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=MDqjLbU1OJPnQEr_jJMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: WRm2gsImyD10bzgo_TlhVQ0ZoqiJOA7z
X-Proofpoint-ORIG-GUID: WRm2gsImyD10bzgo_TlhVQ0ZoqiJOA7z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/26 3:53 PM, Frieder Hannenheim wrote:
> On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
>> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>>
>>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>>
>>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>
>> [...]
>>
>>> +&i2c2 {
>>> +	status = "okay";
>>> +
>>> +	pm8008: pmic@8 {
>>> +		compatible = "qcom,pm8008";
>>
>> No PM8008 on the other phone?
> 
> There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T (kebab)
> and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
> this in -common? It would need to be disabled when a dts for the OnePlus 8 is
> submitted.

Okay, I thought there were only two. Do the remaining two feature
this PMIC? Generally we try to do a lowest common denominator in
-common, whatever that ends up being


>>> +		reg = <0x8>;
>>> +
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
>>
>> interrupts-extended = <&tlmm 112 IRQ..>
> 
> May I ask why? According to the docs interrupts-extended is only useful with
> multiple interrupt parents which is not the case here. Or just for brevity?

Yep just to be concise

>>
>> [...]
>>
>>> +&vreg_f {
>>> +	status = "disabled";
>>> +};
>>
>> I think it may be cleaner to move the definition to the other
>> phone's DT (are there just 2, or more?)
>>
>> Konrad
> 
> The f block is used on the 8 and 8 Pro I believe. So I think it's best to keep
> it this way.

Thinking about it again, I'm a little surprised there would be variance
between them. Can you do

`cat /sys/kernel/debug/qcom_socinfo/pmic_model_array`

?

Konrad
