Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB9239E165
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771940592; cv=none; b=C0nJ1iPXBzzDr3tuAqWQgg4vND9eronvxtuiXGGjAR2/TC9AFAmTZkuMP8jYDnRHYGChJB1XwOcMGZ5bLFYF/RzkXT4C8oW0ICqKdxu2hX5D+XEekRb0knEdQQmBk9Fvt7UfB13DS8yjQP63y9qAVTgn84UDdXsS9QKVOail2EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771940592; c=relaxed/simple;
	bh=KdV9DDI4HE7BDnsr7zZOGoqPkZSPUUnrYiqIRzDmiNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nbm9vURx5hfkFoLMMvkmD7Nz5VyANYuTVXWadQuJlE6emwy3QrZn8w3qROBB0ueXo+dBjp+4M+9d+OtdwDhima3/DZPS3F73iHmBMHKllxJJ4yH/W2QtCZ2JKnLpWBdsDS7UW2ZZsS1riDiHZ/2Feezl0JkuQJeyuWDIRQjjewU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L982G39d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I988fCM8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L982G39d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I988fCM8"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFXNf057301
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=; b=L982G39dyY1Xvgxy
	aMM242Co/+oMtGIayJLHxmEo9gLFQqK8x6W19+Q3wmPf9ODj7EmVDmVnUh48ERQK
	095+urQITLqbbBtKHsEv4MhO2spM6isJ4PfZ1/ntxWG29ncaqUFr++tIlocH3J9c
	pV2KjaShvxWXwjtglyQJThsV9VDXxjE2bmYhxwgy7tXJbQIMA3YAQHKpSntuoA8/
	8HoLz9f4hv7RLybwSyTIpYUUAFq97n0X08eXUet877OGL8qNCLp9q6ih9zpJmLW2
	PQlzuOYuVP0wpkCZGJ69LvtmoI5cJipHpMhia5W7JHWpgVOJ3CYBiU56QNfeJacf
	cKPeHA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch9sa8jrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 13:43:10 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f5406916d4so1015791137.3
        for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 05:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771940589; x=1772545389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=;
        b=I988fCM8JGvZidOjaAr7EdaMtbgK4nu8HdIyDztztFbP/rawvofaxAmbhJWIAQgdkE
         36vpemJ0xw/3iF2/Av37AOMu+YTQKtK0z4iiuTcGfwvQAiowf14pr8FDbhxAhES/Nmnr
         4TKfLbPYmC8/fvEZdslIFissGCdGumGhjH+xdkq3c8n3WeBviVvyBOuiy5vqCuiVk4Nu
         ApReChu9ncF4TBcJgBivCw0jQgEgUX4WAaxCXe4A9raQSCYnU2qKkogjjFL0oihzWn0m
         t5+lZPUDyNlxSTCRr1/Qs2XK3gVid0ltojxsjPdhkguTpQUd+Ejq0XP4kBUGw3GaFc+d
         zwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771940589; x=1772545389;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AXrkbqkgfYscNPb3DcpAoVm2cHgW5eH/clEG7sy6nkc=;
        b=No7e+IxS5ggA1s52ER+yalHLuYVqe0cf21UV+dcuHPg+Vrw8olYfQUI07M+rvL0dU5
         qGB0QZqLzyld1G+mD3XzllX3UduzXt4XZhpdIUV4V1FLci244HnvlXDYjwRvLM0O2q/9
         UR5rPOnjpaZboTk1gMKYcA1dfPOw2m7onEk4m1Hn4ThrvD5q6iCom8U5ERUJZK4Tha1o
         IrLrT5Vy2ESev4yS6AQQb6tF8zcs9V2aLkdTj2kTP8HfskhENBF7pZNdmhNDtnMRlVud
         87Y4YtdsQH+/HcuxbGS9qcdAfebndgAQeH9u6Bq3esIznizNuHbUUXUuFs2ermGEyjOw
         pH1A==
X-Forwarded-Encrypted: i=1; AJvYcCXZfX9+EaYsIONCSH48Ur3Jrn8yYDOSRfUi4NdnD4lOMvehFWbTVeORYnJ30AyWdYyBgMUnjHqrtvty4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YycfasMcSWEvBLlQrANzIGq8K3E7XNgKNg33F5xdWjFEc8X8sBv
	KTMpW6trf5xx1mUbuP2cVzvMMI9tNkH+H+np92fceH2S46mmL4hyytmb46Xjfd1cy5ZFqliG/zH
	0sm5ft5pTxGGNMwvWBVPOwewvqazwgWMqxIWwOr/gjYVPyJr802z/cjXBRcKFSPD7wQ4ddWh9iQ
	==
X-Gm-Gg: ATEYQzxmSMwxbCE6j+shcjhyRaOrixLkgLlQS5WZt+E9QXsX9m8DZlKhsupgWHGt0ab
	L/h+6JoGb3TJHhJgms4JfuKN6Y4JYR6KmD+ZOVvmpZtyHjGfGx/o6jZZ2+Nzj/6o66kjf5c7iMX
	9iZGrSfXAqOEWaZWK8Ou38P1F2BA+odxieXzkhm4iirAeeg5pfMmCak4hbzjWO+oSPi9BEDTpAW
	FX8qbfA0NCC1sJIsPYD0FK6KM9TKS8yEKKA6DJtEeskZBgum1BSz663tEWs8xRFtRmLBsTCPeJ7
	AjIVWUbJRvYBpt2pkruwJbHc66X3Fa1iwrQY4Xd4S2Pk7dtrjej/1JJG2xh1BfVDg5KNM7eOLbN
	UFvliDK1S711hn7wf3fw92Pc6HMnvRzc3vTZ5LPTiX8EaWkVwx65pvezwGT6xa/n2A5QSi7NjlS
	WctwU=
X-Received: by 2002:a05:6102:4192:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5feb30b9613mr2410056137.5.1771940588879;
        Tue, 24 Feb 2026 05:43:08 -0800 (PST)
X-Received: by 2002:a05:6102:4192:b0:5db:25d3:28b4 with SMTP id ada2fe7eead31-5feb30b9613mr2410026137.5.1771940587129;
        Tue, 24 Feb 2026 05:43:07 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5feb6204a47sm10763224137.2.2026.02.24.05.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 05:43:06 -0800 (PST)
Message-ID: <d661600c-0b45-433c-9bbd-0ae5a3386804@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 14:43:01 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
 <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
 <124c661b-db25-466a-a163-99ca336a3e70@oss.qualcomm.com>
 <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c7a4fef-e7c6-43d9-83ca-65a182a33adf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExMiBTYWx0ZWRfX1BrjiCO1+I9v
 P+YMNRs5bMwbVI3PttJvPYE+rHQ+Mk+2Xro5nyvldMXIBF/7h35BfHdux4Y+uVfaP1aeloNTXG3
 DOLA1SiO19K5hviizcNsw9yZZXsic8sgUkxXnLmCVy3ZfSqtfPuAQyW3NTl+KBAge+9Y4N9LdrP
 IG7C5g2Hg3KvudLtJb9HlJmijihz9ux4bWKvxxNSMs41M/fYKr7ZEenSS6BEu544FQaWVmPUd6e
 BUVeB4dki3+HuIE1Dvh9zII1AqNaQjjBvpeZ26u7zDh2UaWczqXdQ5afHV8G32cofwBsgcK5PAf
 3kmcG0eHL9scisYKb6C8Mw5nI9BbSxXPUZmTa9MOLJ2iQzcC1Q/Ochkq5S5/TYz1U5eJAQ9qX5L
 d6FmCRqAqQt+ffiUIuqV/pRBAlfMnY1E7QUMh0JlI1z18M4A7dolB9BZbpWyPK3Gg0Q8oaH9m5k
 z4rrrahtRTjRQILNGhg==
X-Proofpoint-ORIG-GUID: XVL3zuTHmKfsoNx5U_epfK5hEZm-1Hg9
X-Authority-Analysis: v=2.4 cv=e7ELiKp/ c=1 sm=1 tr=0 ts=699daaee cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=knmiLqVa1aBOnVowHCEA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XVL3zuTHmKfsoNx5U_epfK5hEZm-1Hg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240112

On 2/18/26 7:12 PM, Imran Shaik wrote:
> 
> 
> On 17-02-2026 05:31 pm, Konrad Dybcio wrote:
>> On 2/17/26 12:56 PM, Imran Shaik wrote:
>>>
>>>
>>> On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
>>>> On 2/13/26 2:15 PM, Luca Weiss wrote:
>>>>> Add bindings, driver and dts to support the Camera Subsystem on the
>>>>> SM6350 SoC.
>>>>>
>>>>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>>>>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>>>>> far as I can tell.
>>>>>
>>>>> Though when stopping the camera stream, the following clock warning
>>>>> appears in dmesg. But it does not interfere with any functionality,
>>>>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>>>>> while the clock is on, and 'off' while it's off.
>>>>>
>>>>> Any suggestion how to fix this, is appreciated.
>>>>>
>>>>> [ 5738.590980] ------------[ cut here ]------------
>>>>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
>>>>
>>>> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
>>>> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
>>>> and keep checking the hw state)
>>>>
>>>> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
>>>>
>>>
>>> The parent RCG of this clock is under NoC control, and seems like there is no vote on the NoC while disabling this clock, hence this issue is observed.
>>>
>>> The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting is removed after the clock disable then also this issue should be resolved.
>>
>> This is very useful, thanks for the insight!
>>
>> Is any of these solutions specifically preferred from your side?
>>
>> Konrad
> 
> From clock controllers side we can use the BRANCH_HALT_SKIP as this covers both enable/disable scenarios. But this needs to be checked further from consumer driver side as well to handle the NoC voting properly.

I'm going to read that as "better to just fix the user" then, since this
splat essentially acts as a mining canary for incorrect ordering

Worse off, the camss driver currently doesn't consume that clock for
sdm845.. (clock-names entry "gcc_camera_axi" is nowhere to be seen in there)

Konrad
