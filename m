Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A543B6D2
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045233; cv=none; b=QFjnSlJIku0v+lEuqjasgsDhK8UVP+6nslPK/HkmpW6CvjoosG9fmgEkDyst/Qzj1U0zzSgZA20nve1sOSD7ln63SARFEUnYDIYJIn4+ObWxMOwNMbD/4KFqbECT0Gh57lvdVh6oygEggB07JpuMjqT/V16HYDnajBEMufKlyTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045233; c=relaxed/simple;
	bh=HOzaqn7FWoU3uqnSOyQBd4TPMxWPjZbi9HMAsVsni3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+Bes4lga8kNf7SxAHFES9Rr3liIewQI9ouHXb+HNCEsTMpXphrrN2/J/SFpQOtozuHbhCMrP3o2KC1m/Qstbwo4nudjOgmNFs3CdJdNLhWCXf0tr0IQe0oEGxxxG4PamtnKq6weQ5wC1KMLCc+2r8fRiw32l3BBBRkfki6rRz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=edAcXKQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cip6frNv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="edAcXKQj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cip6frNv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGdc644982
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wAv7FEBc74k6otJNq9YtrT7LHKiphv7DSNne9Vn5z3M=; b=edAcXKQj7CErUlUW
	cH9Jy9zQiEG7I4PY9wgxjjNmqeVCXEi7vfRzTTyGNwm7nn2ink/PdvGgpsUzpMcI
	hx4rCDonlcICcju3bdVn8zguJhFs1HHg24zhbWEVgjgY2kDoIMJ4eL33PI6tFPd+
	bWmr5hkkQMEAlTMNYfDHhiV7BP1dQqFx+ao5YHL5Q8C7dhsBwELTNSU9OZOr+0is
	zaDpRI6/6PPNGsB3uv69e7mI7P/3gQfP5B67BrTG/7RRp9epfwevgQR4HmarJ99z
	e9+DWyqAJp+k5QShAFOMkaFON+VK2BP8O35duiE44pSw6nTqMIo0cng5fpeXXZ3s
	3eaGHg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611btmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 09:27:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930b81c13b0so32257085a.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Aug 2026 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045230; x=1787650030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wAv7FEBc74k6otJNq9YtrT7LHKiphv7DSNne9Vn5z3M=;
        b=Cip6frNvHvYWkZypSNX5Q9FrEebv4VigEQCgaAtWPnn/Wl+5bSH8fVJ6dsNAfZF9Dl
         wKeI6bmnorxaMUPjzxDBmv2B1T5TAazsb2RbSw8Sozt51BRf14UI/d/ZUryrpwGCaa/F
         Y1a8M9t51/CXykTCeE6GDphoP2nDdq+PK6iwsDir3/eBqbtb3SexRJ3e1lL6wH/CGIAP
         duuAtTnvtkgj0+2lj7JRB+50xQQdQY25WFQDXUQQ01H3gz5lFYtsmlmwIUXZnSQ021At
         YoKM01DCh2+P7iuu6UZn69mnixLbh4DJ4sIFiaRQogc3AK+chVr88WNfY7cr6Fj20QA6
         1DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045230; x=1787650030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wAv7FEBc74k6otJNq9YtrT7LHKiphv7DSNne9Vn5z3M=;
        b=ETPRTYgaOvQvWgprXuLXjGeAZJFmat1Kcnj2OZFc74d5ZggggwbXOBe0DJxj+CRhCd
         qmjZcuf5M8f73fgAL4utcB0fRtF0IITvFUkvMthIyOys7m993dMwzViyGByV00db54td
         V1OyZDZ5tFBeWOLft/KJit63J8CZ80GKXYurDF+C7iyUJ1+RwfPUoW+UARwSNt+7hw4w
         7s6pgjxmaJpSK22zzuykkUal7cz+yBwurM2tf1cLMbp49izlrJP+GIKyEGG9RxspjHrl
         xgrEzYtFXZ+Wnmaq2XOtfZWDHDCUP8iwbImB1QNOx1nFHazYuT9rRr+ObzGKW+hpP9s6
         xHEA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5BX7XBtT0357alFlXXMONNGuFwHOQfxh+mQRcAmXTctwYnXjL+npx30YUPg/SkL1dpgu1jMamH12MCA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/eihDubPumdnuJzaG1y4+h1DO0lj745guV+f0VwVM4RREwZoi
	QPhGc24Mr9CuqBKarTgZn1TaP7MOWITCXt0PX0/fQkVL4PR6ozVW2sW+GVO+rFQ4qrtEiYWlY3s
	fdTS8nQqJpXQTW+38cfMaGog7zu94ypSR7iBQqgcJyClAF7qHHmjkEP2p8tE9cl+SjA==
X-Gm-Gg: AR+sD13YBJRvTW8ttjoEax18Q1xAT7UEnKvVWZUB5+iGjBOM6zr4xR0ukjtarLD8gD2
	athnDFdXiCzUr3gTyrvm3CC7K7k362fM1pNBzX1vnH+ZaZGj4JaL6w1EEmTV3PDkO5Y129zq2rM
	SKePVH30AveOgDmaYcgQYKZdcoNqIdZ4nciRv6fD7hQaoEgBwqBcC/tmgA9Z65fbG70Aa0rR8Is
	TJEzbXAWIf81r+MwHCDIWdqQBDFsE9YzNRWxSN80KKUvC9lTcPKo4DQC4GgAUTGXnw3fn4Y278S
	HzAa3RrejYAJSs2rb+aJXvtT2GIZ+X4ZPIloi3/WyjL1fDEP9nSoZtm1dzw7O1bB+FFbU5nUzVE
	l/HMTMWdsdSK4WXGZa4h+8TTh
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2510699285a.4.1787045230051;
        Tue, 18 Aug 2026 02:27:10 -0700 (PDT)
X-Received: by 2002:a05:620a:800f:b0:936:5ad0:fdae with SMTP id af79cd13be357-936d23c8621mr2510695985a.4.1787045229545;
        Tue, 18 Aug 2026 02:27:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73db1sm125126366b.40.2026.08.18.02.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:27:08 -0700 (PDT)
Message-ID: <8f05bf47-183f-4586-8ed2-eb2277f15c98@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:27:06 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
 <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0TcUQ793JwElZWRdRQfComElZBhMUnFZ
X-Proofpoint-ORIG-GUID: 0TcUQ793JwElZWRdRQfComElZBhMUnFZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX7HFKfA8Ub7Ah
 NmHCL8TnAZkiZFvs149NTpd9LVsB++0wGsZ7UV9v4tZymO2uBV9UkKrkN1WplDGjbZzG7A4MwrV
 e+1f0OM2H9ebJx99fyVSB9cb1KiU22s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfX61PIPOvrSYFf
 9Lw0oWoj3mLPUjxTb2iO7TyayDiHC8tR1fGq+MdElx72vKIWvb2sIzhEgKvM6BuOH4/WLikmphT
 xaXsm3oITuVdhW5LUje45pfjiejlCq+UDfG7H6JEPYowwcnZbaLqhqk6xA3LqpyFQewRWF+c7s/
 T48C3zKaivv5qmljFwfQzCXCYzWbJ4ukQe9ekeRKXIdbkZe/pVdkwoXLJgbWA2zW3A5hbR/bFyu
 4J21obESBNZbhwxBlFHvKxWPovlMvmINZajGRiDyimZPEOiALiWxAOk/UdMYH3b0dRxAWnV0ECt
 R0KZyiykNKHLY40iYuayJEFh9d4wNznwTgm4Q8Pl9GBwIXMw7/IXmq0MR32LyUK/IORBQ+Oq1aP
 ulVctjNArlVyQfmVANmBvKTY+7ojNjKBm5Wa864OZfXYTGj4WBiXar4CBwb+ms3dospY/1aZxHd
 sNnTgTMKOLOcwT2ksuw==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a84256e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=B_xDH1FeeQEyQcU7W4IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180069

On 8/9/26 6:48 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.
> Known differences are battery capacity and fingerprint sensor placement.
> This submission includes basic abstraction for other developers to be
> able easily extend it to support other variants.

I had one of those. IIRC the Pro had a 3d IR scanner (vide face id)
whereas the base one had a normal IR cam

[...]

> +	reserved-memory {
> +		adsp_mem: memory@8c500000 {

adsp@ etc. and drop labels where unused

[...]

> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0 0x00000000 0 0xffffffff>;
> +			reusable;
> +			alignment = <0 0x400000>;
> +			size = <0 0x2c00000>;
> +			linux,cma-default;
> +		};

Is this necessary?

> +	};
> +
> +	vph_pwr: regulator-vph-pwr {

This is out of order

[...]


> +&adsp_pas {
> +	firmware-name = "qcom/sdm845/Xiaomi/dipper/adsp.mbn";

Would you know whether the FWs are common across the SKUs?

And more importantly, regulator settings? FWIW it's easiest to compare
compiled DTBs (or even better, ones pulled from sysfs on a running
system)

[...]

> +&tlmm {
> +	gpio-reserved-ranges = < 0 4>, /* SPI (Goodix Fingerprint) */

odd space after <

> +			       <81 4>; /* SPI (Synaptics Fingerprint) */

No NFC eSE reservation?

[...]

> +&usb_1_dwc3 {
> +	/* Until we have Type C hooked up we'll force this as peripheral. */

Should be fairly trivial on 845, no?

> +	dr_mode = "peripheral";
> +
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_hsphy>;
> +	phy-names = "usb2-phy";

No SS?

[...]

> +	bluetooth {
> +		compatible = "qcom,wcn3990-bt";
> +
> +		/*
> +		 * This path is relative to the qca/
> +		 * subdir under lib/firmware.
> +		 */

Let's drop this comment, not very useful

Konrad
