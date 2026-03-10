Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F53CF025
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773145856; cv=none; b=tLk0vYVfS+1z5Cgt4AGq/jIA+XFav9EHnLJ59QEop9Pz2qPCFYlTREVqsGC8Mh/km4rBQFfYy6HQvd85pKzkD0QAJuuOzPRTZdxLV/TJ1IQYZlRu63dPc6tAEu/bmIWz+zn1TALWCTghsG6knUoM5klHd9NdLroQy7PU5BVkSvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773145856; c=relaxed/simple;
	bh=jSATiF9xfB3+Wq8PWkAs8NlQggZLlFInbMgv2F8b0Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGm+yGIglLj3CTAOJhcNbkE6a+9JVeZpaEP97DswuttapsRIh3Aj5hzmZEaX4mJvsSFG1pOnMPGG28GTfTHizPYYDP46fR/1omxst4SamqrOdA1HzjrY65korsrRKsOCVBbBL6ZRTc8+VB4QZA17HbJaKtjgLy1voQGRmIvX7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nL26nhQu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kseAQ/yu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nL26nhQu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kseAQ/yu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wSSh3124655
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=; b=nL26nhQu1x836ekL
	0C4GUm6rVxtYqq9Sgcqsqi6S8MM+rueV28ANaIgyfFRkiPtv9cbTooT86dJeD2Zd
	wm+0bn4Kim0PEqJJa+bGJmnnK359aHbWACmVJpNrjfrJ6HQeu7zbcerKjI1YY26f
	fbBabm5ZIpRlgynFXdqM9gQ5q/TLF6zm509ZxT5mAWyl9QskkvdT2sX4FeT6aXJb
	b4m3nn3tzKfyDwnYzu7wQNyaDXZUolxSy7OH8plkxkn+Wi/ZWGpazm0bgepn7Aun
	XxeYSv2bvgCw4t6Othp4FSnEvbTHUPyBmEa30sr/KyfqRhUAfQkOJ+lEOGqcCLZq
	lrbbeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj11rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 12:30:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so178979585a.2
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 05:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773145853; x=1773750653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=;
        b=kseAQ/yuHLBtj500+LKcyt2Vy6Glr4YMNyBjoh608pt+Lo8xDB07X1TUbZlzNcA8m2
         sfCNu9fFUXYcuKhJN698sKITqoUtt8AYuujglgMXGeWYn9hKFLyGQ3F9yAvcVSMrny49
         bN9YRHqjin5c9FlyDlm8sNMeX7CQ3rl9q8RSI2gaSEq1GzGzOviBwXICXdYCcQbAsDxa
         9BbU25IA6NGQwDYiSS9yHtxmkiK7CABC1Ps4RXd1IodOLb0zPitIPckMVr+qH6Ft/7zv
         3NcnwBj7XdAn98KxnDY5jWnADX6SiP29xWrUJTYXJ/1VyukX1qcGrn2AudVNvHrK+H4z
         yAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773145853; x=1773750653;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VzkmLjRqtvKlkeC637966q5Nji7GS6ua5xJoVJknTY=;
        b=SWBCwwqF7n6LNloKL0+lhCJmp3ac8jZjUrGI3f+hGZd07LiyMyQIbfhii2YFoZsuG+
         FsBukjqqIjGCD2bcJcI6aEPCYXr/NNKVV7iWynXnOr8UhvSFjM+nRFDCXRiXuyTIVaWY
         Kqw6j0sppCDXL+D/bfYSQbE199QHk4C29v9qepmn9qGgb7PckYPvovM7RTv8c7HN54VL
         C9C+5fpQDk2bqL6ukk7bA9TjJesIQiQxILlKV9voYG+KdVEKo/1NU9xhmJ1+YWW3QfRm
         gcTx4n0vKw4o4ODnYrwepQGPqWc3FsZahM2Vkgg9+Nei1G3lcB8Io19g/P/yr7ojtPnI
         hmjg==
X-Forwarded-Encrypted: i=1; AJvYcCXQsam+N8cQyM+eS+wAPd3KhE/e0JM5r/rkMlO6oMwUwJQcZR6qDPDklXRKuYDXaulUVsiGmAEfQ4HW1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfbh80zj0uxTQap0/6SLylZNlmErrJi4PZloTF7U9Vld6bEJz5
	jqKw2aL8BINzJoYbQmpeVznIt6mnKrIJKAfpg+FYW/ycl3r20jkvHoctmZ5/Xbhjuc3Y31bW/Bj
	c4rY63MmVV/lrOOrhPcbK4RxOsg2i6g7KQqF2J9B5UHuMeWcu7E+8DtvZBeLSusIpiw==
X-Gm-Gg: ATEYQzyMsW2pevuLk9kBqZYI9jy7bMOupruj0iI1ylCbr6iEhjIR8olxdGoNACSiozv
	FsUtExN460Sq05tDaphEejEs+QnnuzSl93W0sgBwIbAW80UGY9pYK/Od+ObKPaqzBqdN36CoHPi
	ye6CgA7WEf84KW2hT32Gb1rRxpm4DrIrBAdg0az6OUZNTyr+gHYAYdfB0zWqoTtnHYAt373yZcv
	SoT14flbySbQDsNBq+0jmyGoENw2gtkbVCIqrZVHXGYkvgbc59eIXy18QpnOiFN/mlvIg592e0R
	lyaOtRWZMC8ltPyjR/ZiHLq4v9jF0V+ELp+dIw9/JJhsAvWmYvqaKnWaFMnHpQLbvBBM/xB07XX
	Joml8ZfslHUfuSmfZxalBlfk3BrKQfNZX/JdP8MXQpeWTuG0UgrCxxuFk7g2Lq36sa9mXQgXKeL
	73psQ=
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr428495085a.0.1773145853057;
        Tue, 10 Mar 2026 05:30:53 -0700 (PDT)
X-Received: by 2002:a05:620a:209d:b0:8cd:8bfb:a4a with SMTP id af79cd13be357-8cd8bfb0eb3mr428491885a.0.1773145852600;
        Tue, 10 Mar 2026 05:30:52 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f189de1sm479139866b.63.2026.03.10.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 05:30:51 -0700 (PDT)
Message-ID: <bd0dc1de-c157-4f18-8010-ecade0a4b40f@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 13:30:48 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: Stephan Gerhold <stephan.gerhold@linaro.org>, Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
 <20260307-wiko-chuppito-v4-3-325ac66ae338@posteo.de>
 <aa6P4rE7d2ftaeAw@linaro.org> <aa8__ofJBdMfavbq@MyryksLaptop>
 <aa9Epb7MQ0qVFWGO@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa9Epb7MQ0qVFWGO@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69b00efd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b88osBH9l-aT6nkOueUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B-7jYl3nxskPqpbr5vdGiFglR8MkhvC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEwOCBTYWx0ZWRfX2HvbXI8F5HfR
 TCwcmv7A8RQT+lj8102hQ5QptZhz18YrWX9ITGLqgSHpDL/DgBFYyoZkKcV4QoRzgwyZ9a2PE31
 UkoElTVU5O882FCrrFlphbh3rqUJpuTbYzN1yGH8VNQcBrzoXQpLGbFGfEvm9FsxYW3KiMc3lw1
 IrwFfoY+cxOlbjs/62y7IbjtkQQwLWZLKfpgd+RVcY1qfM1j/l7lfwE+XVqZHoLnKsgG3cVYhlf
 T/ZaK2Arp1fJ8tUVsoD2RS0wQQih7wgnjs4lwttr4rIBlGNWH0MlqOwj/uI4XZ+KxdC8qEamucv
 1sjt8Xb/u2JjDcywhIE755w2q1wTrPHjtxRpwwbNvzbcD6IFgMHAVUs8GzpZ8Djuu1F0VAM4Bb/
 paZMjIdxf91YwMYEh5iCMJHYkGT41CCfaiLTXPB2EnZz2sEDzm6tgMI+6Gf/eu76+rzPqKhBnpX
 aqdpmDjJI+6LlU3A1Jw==
X-Proofpoint-ORIG-GUID: B-7jYl3nxskPqpbr5vdGiFglR8MkhvC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100108

On 3/9/26 11:07 PM, Stephan Gerhold wrote:
> On Mon, Mar 09, 2026 at 09:48:12PM +0000, Paul Adam wrote:
>> On 26/03/09 10:16, Stephan Gerhold wrote:
>>>> diff --git a/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
>>>> new file mode 100644
>>>> index 000000000000..d927bae2b208
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
>>>> @@ -0,0 +1,315 @@
>>>> [...]
>>>> +&sound {
>>>> +	audio-routing = "AMIC1", "MIC BIAS Internal1",
>>>> +		"AMIC2", "MIC BIAS Internal2",
>>>> +		"AMIC3", "MIC BIAS Internal1";
>>>
>>> Sorry, just noticed this now:
>>>
>>> This seems a bit suspicious (I would expect "MIC BIAS Internal3"), have
>>> you tested if the secondary microphone works?
>>>
>>> Thanks,
>>> Stephan
>>
>> The secondary microphone does not work yet, neither with Internal1
>> nor Internal3.
>>
>> In the downstream devicetree its Internal1 for AMIC3.
>>
>> Is there a way for me to check which one is correct?
>>
> 
> To be absolutely sure, only with the schematic diagram of the board...
> 
> Another option would be that the secondary microphone simply does not
> exist at all (i.e. there is only one microphone). Any idea if it works
> on Android?
> 
> If in doubt, it would be better to remove the line for AMIC3.

whichever way it goes:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

