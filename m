Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80DA283FC3
	for <phone-devel@vger.kernel.org>; Thu,  5 Mar 2026 08:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699319; cv=none; b=DoCZXuFpeoA3HjJ0HXqZj90iKiT665shHCevXN4nr3HvECfd/1c+0vX5L/mY1kZ/gAvKCU4Hhs9qdOdzANcyo5oOcSXIvySw23niDP0Lge2dfETMZBB1QIHynahoFkJiaM9LVimBG9+dNF2YlSwZoSNOC3iVQ6bx/uFCqINQJ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699319; c=relaxed/simple;
	bh=JwApMPYiG4fd/ILnv58A9G+Wcb/3tF+XZk+KEDsh1gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dwj3ZW4GrOZBA4QO+k3buouyObWYjihv/Ucs9/rWZ6kpV2iEUrvDJGMJqt+Nb34wTKfcY2QC0h39mkJsWcAwpx44zts5KFmP4wqmYceek+We4w5auZYD/a3IGUiBnJt3OO1e2nVGnABBz/1LJ8EdfRo9/kVRO4B92OogRA8v7hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/KxXZzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzvEU6tz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/KxXZzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzvEU6tz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251CEEh3473560
	for <phone-devel@vger.kernel.org>; Thu, 5 Mar 2026 08:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=; b=A/KxXZzjrwhBKTtf
	xknJShvWkVYN1otjYIetX2XvjAB+2HazIWy7LzL0fkNAJgsobAmu6skfI3H5JtX1
	+NvTZqRh5TxSPdfxUHu81FaVsTnIlzGMUVREfOeVkPP1XJMadYcVaK7QCf6gxsis
	vf7+hUYHDfLRdqZR/auibSPTPP1f8pObKDQzyd2zFU5BivWxvCtnJBp20MrE0GUV
	deI3ujDw1LMsoxUwzskONrbHOG9EaFoxunskpNDUExTsuntSX6WsjW7YniNCIsjc
	nP76ksbQI1z1+4ZkhNmTDEWeAKaAQU/CRap9SHAgxbVxCSdfFZa6YMyY92XR7Qvs
	lPfEhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpj183wtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 05 Mar 2026 08:28:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb38a5dc3cso577621985a.3
        for <phone-devel@vger.kernel.org>; Thu, 05 Mar 2026 00:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772699316; x=1773304116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=;
        b=bzvEU6tzu8LQIx5J+I3mBt6x13UsytFwFvx+HWXyuqDzwx3SxW+LQ+PTJ+s1byTM5E
         2kVow+5GeH1/vOmU2a4yguM4L2RnQMyjOovfjrFJJWizRt9Nzm/R9dnZ/0N2feGWkvT5
         qGerlCSXLp9Ssk/fDcATPiUu4RRBGdSJU7ufxEX3rpaUxCu6e4oGE3qIThqV5Kwc8P26
         CfP4Q/XTGH4oeDDNhIsbL7Kqc3It8DylT72EH+xxOiTl5fBDnC40xwLPwTeGIGm/62qf
         zrsdmlpihCSowoMO8op0s1x9U5NWiirQ78t9cezKvj4nRaHGLX6HtBBtjgRG/pmfasFY
         ylhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699316; x=1773304116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mgrx79lfGEzLBlX9QN3Dz4SsddgdoZaYB0lKI1UCPb0=;
        b=jtFCS3+VDU9Mh424GQ9UGhx9wxPP82ocS2vi/RPzA7yDw7MfDeqB6qszSY6uCCIHiv
         gSL0QvwL6DhIKNr/Sr7UTTml7tc361Ur2lq9TT06JGHm0lJwwdAJrv2vbldLKPYT1S5b
         B3gjNMss1AXJlu8fRstadwwmb1moThQhgSJDeOe0ATNRAoFNvpPrdo8pVOZ4EOPUiX2i
         877ENvl7paXnaP0rh5VjLGCgnTtFXQ8Wf7or/4Cif+4ZoKG+fHMubLPv6HlvPJasJEl6
         IwvCnIK6ilSLVppqHctdVrSgiMtWiC1x4TwSDWvfG1BoP/rH5pPfgpdNTiWZlB/u6jIn
         EPag==
X-Forwarded-Encrypted: i=1; AJvYcCWyndnh7xgzwnMh+Z+pxbFmqDqjJmfrSWC9bGmCzJMYTcQmL2un/jx0P4CNrFfPeeW8UutTxpmobYi3KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVBsu/DhT0pEcQPlG3dwNzGfdvaC5VahYZ+AY35rHkgHLbNjv
	qN4GOGZG8M1q4/5qqbKavmEdtb1wG5uT/5XxqYNIeEokFPn8d/AKPlm49ImHJ5DNFjMv/ceeS4r
	xBtZInM0m2fLYpz/bTzegGtR5W81FvcYiAfkfKVPIei5OPboiQ0dePub2Hgyd3Yfr75FxEG/+2Q
	==
X-Gm-Gg: ATEYQzzJlv1Uu/8kzW4WTliCcY+ArfyC/bKJd6iEV6Iry0lcKU0UqZ5zIk1tqSyjU7K
	GPe/oGHhk4NgnA+h7d4LcGhUixa8f/m61ujP82Nb2uZ47EOWG46VtuzvsvJFxNgsfQeoQnBP2HW
	+xLjCP6CCdGrqaO66Kiw3bis+D/2ujPlOnl04Mr+y218VprF5QMJoJKNi6+NTq9REROXdF8BYGc
	w0qqwaBSDbJQhEkNXqgaGEFDIFez+pEWnP3kexImhuaso+XLnllZI2BFWWg8XI53ac2WE6dh2WV
	PpOTZfLTBINSnjyPq72b+ZhOdVmdHn3MhJwQ1aPwx+ARq7W7Sm7usJ0YuXoKdgmpNFQXk9xQenv
	wnLR/AnRRZqVxHJUKicXLu302hLNIsUwmeVSihus61qOnOkc9wEeftqSjpdhnxt/TRNkJnvWa7C
	AmT6I=
X-Received: by 2002:a05:620a:4409:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cd5afa7b9cmr428636585a.7.1772699316231;
        Thu, 05 Mar 2026 00:28:36 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:8cb:52c2:6f19 with SMTP id af79cd13be357-8cd5afa7b9cmr428635385a.7.1772699315811;
        Thu, 05 Mar 2026 00:28:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac84357sm868737766b.30.2026.03.05.00.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:28:34 -0800 (PST)
Message-ID: <a3668aed-0763-4bfd-a24b-f95977d2167c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 09:28:32 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8916-wiko-chuppito: add
 initial devicetree
To: Paul Adam <adamp@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
 <20260301-wiko-chuppito-v3-3-9b36a2a7aed5@posteo.de>
 <9ffc0460-e394-4f18-aed2-ad8a0b3d1b8f@oss.qualcomm.com>
 <aaiuzCWHegpJMCVj@MyryksLaptop>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aaiuzCWHegpJMCVj@MyryksLaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Kf094m7Hay7y8csFc4Lh97EJW3UDIR7M
X-Proofpoint-ORIG-GUID: Kf094m7Hay7y8csFc4Lh97EJW3UDIR7M
X-Authority-Analysis: v=2.4 cv=Ed7FgfmC c=1 sm=1 tr=0 ts=69a93eb4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=boWcjoDG4uMwkFA1WOEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA2NiBTYWx0ZWRfX//YRI+qyFBN6
 ZeijdCm3QdXD65vuLV7tO2dWzIF8OMjUjH9skUEKXvVziGUNe1T8IQCM7J/0uR1yLUsFjnFN9vp
 rQpRhuMHj4S4+ej4rapBqLs24rRoRdFhnxXs9+8bB/EhsOyEeOnczVMnzRFI+5yGXKpQFmMkn2C
 jtEhCcJ2e9pUG3kST1P4rsmwi2ij2kjX2+4F9xgSNyzJUyXvsP16VxwGEGMEkX++GODlmi1q8JA
 7cN1oWxsOtz1IO0meHdpkVeQb6yPTlSUNQveXLDqB2dBc9raCE+suHiHnteZoxYtp49XCDHeLTJ
 2MVM1t88dSJHPU9xnjMaxc4ENtb38APUnhoMZtP6tXc7pDLJXURQi1irJFe0VOU5KzW/DpcdxZ7
 jh3O+xMTsn+imYrhHmCS8jEzQytb6YSfh2LFgOM+PIpsldMn4vm5dHGa1yqpTaQvvcY7zZasIg/
 rVKhlt/9NwPygp4Xomw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050066

On 3/4/26 11:14 PM, Paul Adam wrote:
> On 26/03/02 12:08, Konrad Dybcio wrote:
>> On 3/1/26 11:29 PM, Paul Adam via B4 Relay wrote:
>>> From: Paul Adam <adamp@posteo.de>
>>>
>>> Add an initial device tree for Wiko PULP 4G.
>>> Includes support for:
>>> - UART
>>> - USB (no OTG)
>>> - Internal storage
>>> - MicroSD
>>> - Volume keys + Power button
>>> - Touchscreen
>>> - Backlight
>>> - Accelerometer: Invensense MPU6880
>>> - Magnetometer: Asahi Kasei AK09911
>>> - Hall sensor: Rohm BU52021HFV
>>> - Proximity sensor
>>> - Vibrator
>>> - Earpiece
>>> - Microphone 1
>>> - Headphones
>>> - Wifi
>>> - Bluetooth
>>> - GPU
>>>
>>> Signed-off-by: Paul Adam <adamp@posteo.de>
>>> ---
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Konrad
> 
> Thanks for reviewing!
> 
> I assume I resend this once more with your tag added?

No need, the maintainer tooling (b4) grabs tags whilst applying

> Also is there anything else I need to do, if I don't receive further
> suggestions?

Nope, just wait!

Konrad
