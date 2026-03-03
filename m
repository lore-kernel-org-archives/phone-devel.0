Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46023EAA3
	for <phone-devel@vger.kernel.org>; Tue,  3 Mar 2026 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772534819; cv=none; b=lyOyLioYJGblddHv4dc6AQVWk4DNZVz/ca+pAuSgAsm0tSwTsISvv0s+ZLQvKTIDSBPabL8ZRyXlk6t39edqugvNpiX1WoqEwTEGsA85IEHIyPzBGDrFZEM5PeD3YUR/vkdV8PbmattqaCbKQPBINrMfgF1hKMv3fL8OgC5E8to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772534819; c=relaxed/simple;
	bh=GBQKgN6kGGPo8iDrDErfLf5dCq2wspOVI0iefN3XQ34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbepsZYedK3BOmtFAzJS7KI9nhzn9hsZZdLKzm7so15yiwJvo3qCi/HzN3rtyFDowZVjeRomgqh7qYKjc9mx2MOM1C8wDG7ol2JfVKuyoFJ3T+MKBhgBROdzRrYxXbFzLi23Y2xwRKL7osrvB0vkPXdKQzU4CpMRMEMbHnZNJf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEeYwlk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fugf0zqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEeYwlk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fugf0zqK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239n6j4582415
	for <phone-devel@vger.kernel.org>; Tue, 3 Mar 2026 10:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=; b=AEeYwlk5qFUBS7rQ
	xJ/9qEJcTVhNDbxYZsNhDsg8T8Mhemx9Y2rb5nujNZIAf9oikiDcMuqxw7NEeJXb
	2GQgGYnl/+NRdcFvkNyQGToskXr9OHxER5uO8Ln7i956jdPq6TpTY78bAVb0UpLd
	7ZydUCHlQMvnS5xmn/l4D3GGmnE6TySa9W2HXAlX94TDu1adgCsAvktinodgy8ND
	YUu4uLyFHx9URrIWjMJkudYhLrUlFiW3ShZXJ3pzSjn+RMJ6CR9Ztkw5lDOc7unb
	MzBtM9UzO3HdABqOm4MMSaB0WDKT4PlW34+iua1J/r9h53OZ1F1ipjHIXUbggrKp
	KReCRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnh6uamk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 10:46:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb38a5dc3cso487914185a.3
        for <phone-devel@vger.kernel.org>; Tue, 03 Mar 2026 02:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772534817; x=1773139617; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=fugf0zqK9ar0p/dZscz5d5SwrmFyfIbZGt2NGz+ICaAfb5lFLV4Rdf6LYWdabE/DkD
         1ww0qZye8hyxHRB14S4aA7cR0lL4aHWwPWmjmo4QEKejiV0fDcyKE/URU08tVsXNNbig
         7Lm8HtMlGQBY7aAzceXrbQNNCkoP+/5CfVtIdW//bA1iUGsk1esA8lOG+InbGeP1q5Yk
         BnmEa+M1UqMF9OqQmDmDKtLUQpX47J740/2sYy5B605OlTgVo0YG20GW/c8ol2RMKoAE
         joT1M+inUcLjNBSD2PA47VlXyDYulNyaZcCiXSaUM3AqDBtLQUIIbfsA6wEteX+Ukik/
         KHTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772534817; x=1773139617;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oNwRE1lhrPKpjrfCDBV2iYjvDUcrkSGD+DcEAAQyPk=;
        b=Odl/spKNWVZbqsLeP4PbEFIYHWcu1vj6Ng2BZRw6Gi+t1C07pJenhyOYVpHcXJ0bBK
         zlse9SVhfrEdBvgM+ldpgBXsnEIyWaQ6Zblala3GAy4O6UG9gYwx7UDVjmmb/eMplUEH
         yedGMEGszLZJez2K9b7oDvdth/H8kVRrcrPUWfblLoYvPrn547s1iAlNHSYb08qpywEr
         sGj6Xl8FRNJEUe6zpiBNUlq169RxFcyoVvJrXNcfQy/UMTjQCH0q5yHPmgZm/yiZBG4J
         PuIAliiKzk90aNEC3c5bL0+2KI/WV0rjPaJ9URA49Que6HDzbQ+5WMkl5TncBzua3+lr
         Ozkw==
X-Forwarded-Encrypted: i=1; AJvYcCXJnO+0puk7K7U0CcxSO5o4Ofcmk2/7xE5AxNG7id0l714GzMN/PEcgVLnQZpYi3P7hQS3nnSi5EdJUhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZRIy51HfDH5r/ULWT5t+x25Yi9U63IhliVVhb0BAioBh7T1jm
	M1Oatvo8zI3AFo0KwNY3ORoGqfa4R7rxHdyFvZS8gev14hksgHUkxyBuNMVZ7GLNVJ/pvEw2y2s
	tMIWqwlqJizYYy9v8VwhXOlfPWC56P/u5hLM7BgjiIX4KazQkDDQst0HEgKEJ8byCBg==
X-Gm-Gg: ATEYQzwQrECoJ7YgtwtPhWwQeevspqPePsIAudpJaD+bQQBd356GB/HduwN5kH0BGmZ
	U5A7FE0Cm1Z1tu5GfsVY8JYsJp9oyBQGLRWCVObQcI6hKw0CyNdN4bwmBDHb2m8uKZ/ZfXSuq4R
	PHldAYIzKnZgQRrjCPsIwyZt2zqewW+ZcYU+bDmqP6ditmuvW81OZAMRGNesTCYdNMPiR0Oxz6i
	dttzru9wEmhWuLi8fYyn9vFcqQoGZ2Qx5jBZznEsnGCI1HXU60vQCv1LfFqOQblCyujTNyW3Gy9
	Vx9zZnqugxfuQ1GXF+Z2mRFW6VxfXVHv955Qbnb1uPjX3UdVNo0ARrquZRUfAWnzNTrP38YQAKj
	Balu0HBlrveL/FD0ve75/0gmwML7BSrwF9EZVR9VhzdTjsU8yJad9hRpVIwW2+pOjRL2A7IPvTY
	oOB4k=
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494510685a.1.1772534816824;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:458b:b0:8cb:3872:bd62 with SMTP id af79cd13be357-8cbc8dabb6cmr1494509485a.1.1772534816383;
        Tue, 03 Mar 2026 02:46:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae61474sm577333066b.44.2026.03.03.02.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:46:55 -0800 (PST)
Message-ID: <8644d2d8-04b2-46d5-a74d-6d90b5103825@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 11:46:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v4 6/9] media: qcom: camss: csiphy-3ph: Update Gen2
 v1.1 MIPI CSI-2 CPHY init
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-6-e53316d2cc65@ixit.cz>
 <4f29492f-c5c0-402c-b2aa-0e1886299d59@linaro.org>
 <f5038001-da33-4c44-b9f7-3f967830eec0@ixit.cz>
 <fee002eb-4447-4ba6-bd3c-7a54ec85e29e@oss.qualcomm.com>
 <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fba5ef3e-70be-4329-9f4b-c0eaefe5449f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4MiBTYWx0ZWRfX1HTaCogHbVG3
 88EPNfNynocbmOXSG9/zVTS5nPgNmVopAX4yQu/D6JCOAcrRb1SfJHt2KFhoaN+RjBT/305h04l
 kPfcFiMVN2xnNYw88v0cLSZsyW4koHmMOgq7HtkpkWcUVAzEqgfFz3pw1nubG7SxDxfqVcW+NoK
 kSGnry9aa559gp3b9BGtaPLQ0tTnDpylIKeMA+7Gdl3P33fmjZoeN4j7DcfXYP5/KBjZ6QAWbLQ
 l1RwlETXDfaoj2Rino68b2GL/03N/zdgHsik9N+jQDomkE33I+rdyaWY/6G6SvG/wM5SqDWAnJX
 a7oOXc3dG70DpKqt0J1Ll4NeV1pVLsApGUVAEq0BIO3rSgT/XccwsmNwsDmhHHiv19f/ybiA/FK
 gUpebpVcBKIfUcmRNBxaJqxG+AvQWo28Gz1Xc7z7CW4fNvvU5qhNNVhkrFKhr8C7h3WJXI2E6pC
 j2IWvjxsXYP20AuhDdg==
X-Authority-Analysis: v=2.4 cv=MuhfKmae c=1 sm=1 tr=0 ts=69a6bc21 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=aUHzePZ-ChQT42NVv6YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 1LMimBq4OTno42umEKYzSC1murRqzJvj
X-Proofpoint-GUID: 1LMimBq4OTno42umEKYzSC1murRqzJvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030082

On 3/3/26 11:39 AM, Bryan O'Donoghue wrote:
> On 03/03/2026 10:22, Konrad Dybcio wrote:
>>>> Squash down and Co-developed-by
>> Suggested-by, perhaps
>>
>> Co-developed-by usually reflects pair programming and requires a s-o-b,
>> and that carries legal meaning.
> 
> Hmm yes but this is his change so he owns his own Co-developed-by and his on S-o-b ;)

Oh I see, I was under the impression that the original commit was authored
by him and that you're referencing my request to submit this update from
some older revision

Konrad
